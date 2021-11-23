<?php

namespace Database\Factories;

use App\Models\RegularSaving;
use Illuminate\Database\Eloquent\Factories\Factory;

class RegularSavingFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = RegularSaving::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'member_id' => $this->faker->word,
        'amount' => $this->faker->word,
        'frequency' => $this->faker->word,
        'default_payment_method' => $this->faker->word,
        'autosave' => $this->faker->word,
        'created_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
