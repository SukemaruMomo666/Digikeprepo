<?php

use App\Models\LogPembelajaran;
use Livewire\Attributes\Layout;
use Livewire\Attributes\Title;
use Livewire\Component;

new #[Layout('layouts.mahasiswa')] #[Title('Tambah Log Pembelajaran')] class extends Component
{
    public ?LogPembelajaran $log = null;
    
    public string $tanggal_shift = '';
    public string $shift = 'Pagi';
    public string $ruang = '';
    public string $konteks_kasus = '';
    
    // Gibbs Cycle Fields
    public string $description = '';
    public string $feelings = '';
    public string $evaluation = '';
    public string $analysis = '';
    public string $conclusion = '';
    public string $action_plan = '';

    public function mount(?LogPembelajaran $log = null): void
    {
        if ($log && $log->exists) {
            $this->log = $log;
            $this->tanggal_shift = $log->tanggal_shift->format('Y-m-d');
            $this->shift = $log->shift;
            $this->ruang = $log->ruang ?? '';
            $this->konteks_kasus = $log->konteks_kasus ?? '';
            $this->description = $log->description ?? '';
            $this->feelings = $log->feelings ?? '';
            $this->evaluation = $log->evaluation ?? '';
            $this->analysis = $log->analysis ?? '';
            $this->conclusion = $log->conclusion ?? '';
            $this->action_plan = $log->action_plan ?? '';
        } else {
            $this->tanggal_shift = date('Y-m-d');
        }
    }

    public function simpan(): void
    {
        $data = $this->validate([
            'tanggal_shift' => 'required|date',
            'shift' => 'required|in:Pagi,Siang,Malam',
            'ruang' => 'nullable|string|max:100',
            'konteks_kasus' => 'nullable|string|max:255',
            'description' => 'required|string|min:20',
            'feelings' => 'required|string',
            'evaluation' => 'required|string',
            'analysis' => 'required|string',
            'conclusion' => 'required|string',
            'action_plan' => 'required|string',
        ]);

        if ($this->log) {
            $this->log->update($data);
            $msg = 'Log pembelajaran berhasil diperbarui.';
        } else {
            LogPembelajaran::create([
                ...$data,
                'user_id' => auth()->id(),
            ]);
            $msg = 'Log pembelajaran berhasil ditambahkan.';
        }

        $this->dispatch('toast', variant: 'success', message: $msg);
        $this->redirectRoute('mahasiswa.log.index', navigate: true);
    }
};
?>

<div class="max-w-4xl mx-auto p-4 md:p-6">
    <div class="mb-6 flex items-center gap-3">
        <flux:button icon="arrow-left" variant="ghost" size="sm" :href="route('mahasiswa.log.index')" wire:navigate />
        <div>
            <flux:heading size="xl">{{ $log ? 'Edit Log' : 'Log Baru (Gibbs Cycle)' }}</flux:heading>
            <flux:text class="mt-1">Refleksikan pengalaman praktik klinik Anda hari ini.</flux:text>
        </div>
    </div>

    <form wire:submit="simpan" class="space-y-8">
        {{-- Info Dasar --}}
        <flux:card>
            <flux:heading size="lg" class="mb-4 text-[#1B4F72]">Informasi Dasar</flux:heading>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <flux:input type="date" wire:model="tanggal_shift" label="Tanggal Praktik" required />
                <flux:select wire:model="shift" label="Shift" required>
                    <flux:select.option value="Pagi">Pagi</flux:select.option>
                    <flux:select.option value="Siang">Siang</flux:select.option>
                    <flux:select.option value="Malam">Malam</flux:select.option>
                </flux:select>
                <flux:input wire:model="ruang" label="Ruang / Bangsal" placeholder="Contoh: Ruang Melati" />
                <flux:input wire:model="konteks_kasus" label="Konteks Kasus (Singkat)" placeholder="Contoh: Pasien Post-Op Hernia" />
            </div>
        </flux:card>

        {{-- Gibbs Reflective Cycle --}}
        <div class="space-y-6">
            {{-- 1. Description --}}
            <flux:card class="border-l-4 border-blue-500">
                <div class="flex items-center gap-2 mb-3">
                    <span class="flex size-6 items-center justify-center rounded-full bg-blue-500 text-xs font-bold text-white">1</span>
                    <flux:heading size="md" class="text-blue-700">Description</flux:heading>
                </div>
                <flux:textarea wire:model="description" label="Apa yang terjadi?" placeholder="Uraikan secara objektif kejadian atau pengalaman yang dialami..." rows="4" required />
            </flux:card>

            {{-- 2. Feelings --}}
            <flux:card class="border-l-4 border-amber-500">
                <div class="flex items-center gap-2 mb-3">
                    <span class="flex size-6 items-center justify-center rounded-full bg-amber-500 text-xs font-bold text-white">2</span>
                    <flux:heading size="md" class="text-amber-700">Feelings</flux:heading>
                </div>
                <flux:textarea wire:model="feelings" label="Apa yang Anda rasakan saat itu?" placeholder="Jelaskan perasaan dan pikiran Anda selama kejadian tersebut..." rows="3" required />
            </flux:card>

            {{-- 3. Evaluation --}}
            <flux:card class="border-l-4 border-green-500">
                <div class="flex items-center gap-2 mb-3">
                    <span class="flex size-6 items-center justify-center rounded-full bg-green-500 text-xs font-bold text-white">3</span>
                    <flux:heading size="md" class="text-green-700">Evaluation</flux:heading>
                </div>
                <flux:textarea wire:model="evaluation" label="Apa yang baik dan buruk dari pengalaman tersebut?" placeholder="Evaluasi pengalaman tersebut, sisi positif dan negatifnya..." rows="3" required />
            </flux:card>

            {{-- 4. Analysis --}}
            <flux:card class="border-l-4 border-purple-500">
                <div class="flex items-center gap-2 mb-3">
                    <span class="flex size-6 items-center justify-center rounded-full bg-purple-500 text-xs font-bold text-white">4</span>
                    <flux:heading size="md" class="text-purple-700">Analysis</flux:heading>
                </div>
                <flux:textarea wire:model="analysis" label="Apa makna dari situasi tersebut?" placeholder="Lakukan analisis lebih dalam. Mengapa hal itu terjadi? Hubungkan dengan teori jika perlu..." rows="4" required />
            </flux:card>

            {{-- 5. Conclusion --}}
            <flux:card class="border-l-4 border-teal-500">
                <div class="flex items-center gap-2 mb-3">
                    <span class="flex size-6 items-center justify-center rounded-full bg-teal-500 text-xs font-bold text-white">5</span>
                    <flux:heading size="md" class="text-teal-700">Conclusion</flux:heading>
                </div>
                <flux:textarea wire:model="conclusion" label="Apa yang seharusnya Anda lakukan?" placeholder="Simpulkan apa yang telah Anda pelajari dan apa yang bisa dilakukan secara berbeda..." rows="3" required />
            </flux:card>

            {{-- 6. Action Plan --}}
            <flux:card class="border-l-4 border-rose-500 shadow-lg">
                <div class="flex items-center gap-2 mb-3">
                    <span class="flex size-6 items-center justify-center rounded-full bg-rose-500 text-xs font-bold text-white">6</span>
                    <flux:heading size="md" class="text-rose-700">Action Plan</flux:heading>
                </div>
                <flux:textarea wire:model="action_plan" label="Jika situasi ini terjadi lagi, apa yang akan Anda lakukan?" placeholder="Rencana tindakan spesifik untuk masa depan..." rows="4" required />
            </flux:card>
        </div>

        <div class="flex justify-end gap-3 py-6">
            <flux:button variant="ghost" :href="route('mahasiswa.log.index')" wire:navigate>Batal</flux:button>
            <flux:button type="submit" variant="primary" class="px-8">
                <flux:icon.check class="mr-2 size-4" /> Simpan Log Refleksi
            </flux:button>
        </div>
    </form>
</div>
