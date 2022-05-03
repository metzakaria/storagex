<?php

namespace Database\Factories;

use App\Models\Investment;
use Illuminate\Database\Eloquent\Factories\Factory;

class InvestmentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Investment::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'invest_product_id' => $this->faker->randomDigitNotNull,
        'member_id' => $this->faker->randomDigitNotNull,
        'qty_bought' => $this->faker->word,
        'amt_bought' => $this->faker->word,
        'date_invest' => $this->faker->date('Y-m-d H:i:s'),
        'expect_amt_return' => $this->faker->word,
        'is_auctioned' => $this->faker->word,
        'auction_id' => $this->faker->randomDigitNotNull,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s'),
        't_n_c' => $this->faker->word,
        'payment_method' => $this->faker->word
        ];
    }
}
