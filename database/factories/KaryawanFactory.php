<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

class KaryawanFactory extends Factory
{
    public function definition(): array
    {
        return [
            'nama_lengkap' => $this->faker->name(),
            'email'        => $this->faker->unique()->safeEmail(),
            'tanggal'      => $this->faker->date(),
            'alamat'       => $this->faker->address(),
            'no_hp'        => $this->faker->phoneNumber(),
            'kota'         => $this->faker->city(),
        ];
    }
}
