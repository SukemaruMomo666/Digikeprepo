<?php

use App\Models\EvaluasiPasien;
use App\Models\LuaranPasien;
use App\Models\Pasien;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Evaluasi')] class extends Component
{
    public Pasien $pasien;

    /**
     * Hasil evaluasi per luaran_pasien_id: ['hasil' => ..., 'catatan' => ...]
     *
     * @var array<int, array{hasil: string, catatan: string}>
     */
    public array $evaluasi = [];

    public function mount(Pasien $pasien): void
    {
        abort_unless($pasien->user_id === auth()->id(), 403);
        abort_unless($pasien->intervensiPasien()->exists(), 403, 'Selesaikan intervensi terlebih dahulu.');

        $this->pasien = $pasien;

        // Muat evaluasi yang sudah tersimpan
        LuaranPasien::whereIn(
            'diagnosa_pasien_id',
            $pasien->diagnosaPasien()->pluck('id')
        )
            ->with('evaluasi')
            ->get()
            ->each(function (LuaranPasien $lp): void {
                $this->evaluasi[$lp->id] = [
                    'hasil'   => $lp->evaluasi?->hasil ?? 'tercapai',
                    'catatan' => $lp->evaluasi?->catatan ?? '',
                ];
            });
    }

    public function luaranPasienList(): \Illuminate\Database\Eloquent\Collection
    {
        return LuaranPasien::whereIn(
            'diagnosa_pasien_id',
            $this->pasien->diagnosaPasien()->pluck('id')
        )
            ->with(['luaran', 'diagnosaPasien.diagnosa', 'evaluasi'])
            ->get();
    }

    public function save(): void
    {
        $rules = [];
        foreach (array_keys($this->evaluasi) as $lpId) {
            $rules["evaluasi.{$lpId}.hasil"]   = ['required', 'in:tercapai,sebagian,belum_tercapai'];
            $rules["evaluasi.{$lpId}.catatan"] = ['nullable', 'string', 'max:500'];
        }

        $this->validate($rules, [
            'evaluasi.*.hasil.required' => 'Pilih hasil evaluasi untuk setiap luaran.',
        ]);

        foreach ($this->evaluasi as $lpId => $data) {
            EvaluasiPasien::updateOrCreate(
                ['luaran_pasien_id' => $lpId],
                ['hasil' => $data['hasil'], 'catatan' => $data['catatan'] ?? null]
            );
        }

        // Tandai askep selesai
        $this->pasien->update(['status_askep' => 'selesai']);
        $this->pasien->catatRiwayat('Evaluasi keperawatan selesai. Askep dinyatakan selesai.');

        $this->redirectRoute('pasien.askep', $this->pasien, navigate: true);
    }
};
?>

<div>
    <div class="mb-6">
        <flux:button :href="route('pasien.intervensi', $pasien)" variant="ghost" icon="arrow-left" size="sm" wire:navigate class="mb-4">
            Kembali ke Intervensi
        </flux:button>
        <flux:heading size="xl" level="1">Evaluasi — {{ $pasien->nama_pasien }}</flux:heading>
        <flux:text class="mt-1">Evaluasi pencapaian luaran keperawatan (SLKI) yang telah ditetapkan.</flux:text>
    </div>

    @include('partials.askep-stepper', ['step' => 5, 'pasien' => $pasien])

    @php $luaranList = $this->luaranPasienList(); @endphp

    <div class="mt-6 space-y-4">
        @foreach ($luaranList as $lp)
            <div class="rounded-2xl border border-gray-200 bg-white p-6 dark:border-zinc-700 dark:bg-zinc-800">
                {{-- Header: Diagnosa & Luaran --}}
                <div class="mb-5 flex flex-col gap-1 sm:flex-row sm:items-start sm:justify-between">
                    <div>
                        <p class="text-xs font-semibold uppercase tracking-wider text-gray-400 dark:text-zinc-500">
                            {{ $lp->diagnosaPasien->diagnosa->kode_diagnosa }} — {{ $lp->diagnosaPasien->diagnosa->label_diagnosa }}
                        </p>
                        <h3 class="mt-1 text-base font-semibold text-gray-800 dark:text-white">
                            {{ $lp->luaran->label_luaran }}
                        </h3>
                        @if ($lp->luaran->kriteria_hasil)
                            <p class="mt-1 text-sm text-gray-500 dark:text-zinc-400">
                                <span class="font-medium text-gray-600 dark:text-zinc-300">Kriteria hasil:</span>
                                {{ $lp->luaran->kriteria_hasil }}
                            </p>
                        @endif
                    </div>
                    <span class="shrink-0 rounded-full bg-orange-50 px-2.5 py-0.5 text-xs font-mono font-medium text-polsub dark:bg-orange-900/20">
                        {{ $lp->luaran->kode_luaran }}
                    </span>
                </div>

                {{-- Hasil Evaluasi --}}
                <div class="space-y-4">
                    <div>
                        <p class="mb-2 text-sm font-medium text-gray-700 dark:text-zinc-300">Hasil Evaluasi</p>
                        <div class="grid grid-cols-1 gap-2 sm:grid-cols-3">
                            @foreach (EvaluasiPasien::labelHasil() as $value => $label)
                                @php
                                    $isSelected = ($this->evaluasi[$lp->id]['hasil'] ?? 'tercapai') === $value;
                                    $colors = [
                                        'tercapai'       => ['selected' => 'border-emerald-500 bg-emerald-50 text-emerald-700', 'default' => 'border-gray-200 hover:border-emerald-300'],
                                        'sebagian'       => ['selected' => 'border-amber-500 bg-amber-50 text-amber-700',       'default' => 'border-gray-200 hover:border-amber-300'],
                                        'belum_tercapai' => ['selected' => 'border-red-500 bg-red-50 text-red-700',             'default' => 'border-gray-200 hover:border-red-300'],
                                    ];
                                    $icons = [
                                        'tercapai'       => '✓',
                                        'sebagian'       => '~',
                                        'belum_tercapai' => '✗',
                                    ];
                                @endphp
                                <button
                                    type="button"
                                    wire:click="$set('evaluasi.{{ $lp->id }}.hasil', '{{ $value }}')"
                                    class="flex items-center gap-2 rounded-xl border-2 px-4 py-3 text-sm font-semibold transition-all
                                        {{ $isSelected ? $colors[$value]['selected'] : 'border-gray-200 text-gray-600 dark:border-zinc-600 dark:text-zinc-300 ' . $colors[$value]['default'] }}"
                                >
                                    <span class="text-base">{{ $icons[$value] }}</span>
                                    {{ $label }}
                                </button>
                            @endforeach
                        </div>
                        @error("evaluasi.{$lp->id}.hasil")
                            <p class="mt-1 text-xs text-red-500">{{ $message }}</p>
                        @enderror
                    </div>

                    {{-- Catatan --}}
                    <flux:textarea
                        wire:model="evaluasi.{{ $lp->id }}.catatan"
                        label="Catatan Evaluasi (opsional)"
                        placeholder="Tuliskan perkembangan kondisi pasien, respon terhadap intervensi, atau temuan lainnya..."
                        rows="2"
                    />
                </div>
            </div>
        @endforeach
    </div>

    {{-- Action --}}
    <div class="mt-6 flex justify-end">
        <flux:button variant="primary" icon="check" wire:click="save" wire:loading.attr="disabled">
            <span wire:loading.remove wire:target="save">Selesaikan Askep</span>
            <span wire:loading wire:target="save">Menyimpan...</span>
        </flux:button>
    </div>
</div>
