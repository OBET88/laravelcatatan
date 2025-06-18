<?php

namespace App\Livewire;

use App\Models\Karyawan as ModelsKaryawan;
use Livewire\Component;

class Karyawan extends Component
{

    public $datakaryawan;
    public function render()
    {
        $this->datakaryawan = ModelsKaryawan::orderBy('tanggal', 'ASC')->get();
        return view('livewire.karyawan');
    }
}
