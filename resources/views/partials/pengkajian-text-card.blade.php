{{--
    Partial: pengkajian-text-card
    Variables: $key (string), $num (int), $title (string), $hints (string[])
--}}
<div class="rounded-2xl border border-gray-200 bg-white p-5 dark:border-zinc-700 dark:bg-zinc-800">

    {{-- Card header --}}
    <div class="mb-4 flex items-start justify-between gap-4">
        <div class="flex items-center gap-3">
            <span class="flex size-7 shrink-0 items-center justify-center rounded-full bg-orange-100 text-xs font-bold text-polsub dark:bg-orange-900/30">
                {{ $num }}
            </span>
            <h3 class="font-semibold text-gray-800 dark:text-white">{{ $title }}</h3>
            @if (! empty($pengkajianData[$key]['is_abnormal']))
                <span class="rounded-full bg-red-100 px-2 py-0.5 text-xs font-semibold text-red-600 dark:bg-red-900/20 dark:text-red-400">
                    Abnormal
                </span>
            @endif
        </div>

        {{-- Controls --}}
        <div class="flex shrink-0 items-center gap-3">
            <select
                wire:model="pengkajianData.{{ $key }}.tipe_data"
                class="rounded-lg border border-gray-200 bg-white px-2 py-1 text-xs font-semibold text-gray-600 dark:border-zinc-600 dark:bg-zinc-700 dark:text-zinc-300"
            >
                <option value="DS">DS</option>
                <option value="DO">DO</option>
            </select>

            <label class="flex cursor-pointer items-center gap-1.5">
                <input
                    type="checkbox"
                    wire:model="pengkajianData.{{ $key }}.is_abnormal"
                    class="size-4 rounded border-gray-300 text-red-500 focus:ring-red-400 dark:border-zinc-600"
                />
                <span class="text-xs font-medium text-gray-500 dark:text-zinc-400">Abnormal</span>
            </label>
        </div>
    </div>

    {{-- Guiding questions --}}
    @if (! empty($hints))
        <div class="mb-3 rounded-lg bg-blue-50 px-3 py-2 dark:bg-blue-900/10">
            <p class="mb-1 text-xs font-semibold text-blue-600 dark:text-blue-400">Panduan pertanyaan:</p>
            <ul class="list-inside list-disc space-y-0.5 text-xs text-blue-600/80 dark:text-blue-400/80">
                @foreach ($hints as $hint)
                    <li>{{ $hint }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {{-- Observasi textarea --}}
    <flux:textarea
        wire:model="pengkajianData.{{ $key }}.observasi"
        placeholder="Tuliskan hasil anamnesis / observasi di sini…"
        rows="4"
    />
</div>
