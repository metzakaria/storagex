<?php

namespace Database\Factories;

use App\Models\BillPayment;
use Illuminate\Database\Eloquent\Factories\Factory;

class BillPaymentFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = BillPayment::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'member_id' => $this->faker->word,
        'bill_type' => $this->faker->word,
        'amount' => $this->faker->word,
        'fee' => $this->faker->word,
        'receiver_account' => $this->faker->word,
        'description' => $this->faker->text,
        'is_paid' => $this->faker->word,
        'date_paid' => $this->faker->word,
        'date_created' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
