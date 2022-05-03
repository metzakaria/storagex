<?php

namespace Database\Factories;

use App\Models\Partner;
use Illuminate\Database\Eloquent\Factories\Factory;

class PartnerFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Partner::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'partner_name' => $this->faker->word,
        'state_id' => $this->faker->randomDigitNotNull,
        'lga_id' => $this->faker->randomDigitNotNull,
        'email' => $this->faker->word,
        'phone' => $this->faker->word,
        'address' => $this->faker->text,
        'other_info' => $this->faker->text,
        'asset_type_id' => $this->faker->randomDigitNotNull,
        'insurance_id' => $this->faker->randomDigitNotNull,
        'user_id' => $this->faker->word,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
