<?php

namespace Database\Factories;

use App\Models\InvestmentProduct;
use Illuminate\Database\Eloquent\Factories\Factory;

class InvestmentProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = InvestmentProduct::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->word,
        'description' => $this->faker->text,
        'invest_type' => $this->faker->word,
        'unit_interest' => $this->faker->word,
        'unit_amount' => $this->faker->word,
        'quantity' => $this->faker->word,
        'image_file' => $this->faker->word,
        'qty_sold' => $this->faker->word,
        'is_active' => $this->faker->word,
        'created_by' => $this->faker->randomDigitNotNull,
        'start_date' => $this->faker->word,
        'mature_date' => $this->faker->word,
        'location' => $this->faker->word,
        'insurance_id' => $this->faker->randomDigitNotNull,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s'),
        'is_auctionable' => $this->faker->word,
        'provided_by' => $this->faker->word,
        'is_matured' => $this->faker->word,
        'investors' => $this->faker->randomDigitNotNull
        ];
    }
}
