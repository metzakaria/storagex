<?php

namespace Database\Factories;

use App\Models\Farmer;
use Illuminate\Database\Eloquent\Factories\Factory;

class FarmerFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Farmer::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'reg_number' => $this->faker->word,
        'full_name' => $this->faker->word,
        'state_id' => $this->faker->randomDigitNotNull,
        'lga_id' => $this->faker->randomDigitNotNull,
        'location_id' => $this->faker->randomDigitNotNull,
        'photo' => $this->faker->word,
        'email' => $this->faker->word,
        'mobile' => $this->faker->word,
        'address' => $this->faker->text,
        'produce_description' => $this->faker->text,
        'created_by' => $this->faker->randomDigitNotNull,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s'),
        'deleted_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
