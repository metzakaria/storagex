<?php

namespace Database\Factories;

use App\Models\RegularSavingsTransaction;
use Illuminate\Database\Eloquent\Factories\Factory;

class RegularSavingsTransactionFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = RegularSavingsTransaction::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'transaction_ref' => $this->faker->word,
        'description' => $this->faker->text,
        'amount' => $this->faker->word,
        'dr_cr' => $this->faker->word,
        'date_transaction' => $this->faker->date('Y-m-d H:i:s'),
        'bal_affected' => $this->faker->word,
        'member_id' => $this->faker->word,
        'pay_method' => $this->faker->word
        ];
    }
}
