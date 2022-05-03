<?php

namespace Database\Factories;

use App\Models\InvestmentAuction;
use Illuminate\Database\Eloquent\Factories\Factory;

class InvestmentAuctionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = InvestmentAuction::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'investment_id' => $this->faker->randomDigitNotNull,
        'invest_product_id' => $this->faker->randomDigitNotNull,
        'qty_offer' => $this->faker->word,
        'unit_amount' => $this->faker->word,
        'total_amount' => $this->faker->word,
        'is_sold' => $this->faker->word,
        'date_sold' => $this->faker->date('Y-m-d H:i:s'),
        'boughtby_member' => $this->faker->randomDigitNotNull,
        'date_created' => $this->faker->date('Y-m-d H:i:s'),
        'offer_close_at' => $this->faker->date('Y-m-d H:i:s'),
        't_n_c' => $this->faker->word
        ];
    }
}
