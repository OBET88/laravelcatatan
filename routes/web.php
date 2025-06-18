<?php

use App\Livewire\Dashboard;
use App\Livewire\Karyawan;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('layouts.app');
});

Route::get('/dashboard', Dashboard::class);
Route::get('/karyawan', Karyawan::class);
