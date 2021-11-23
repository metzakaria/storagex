<?php

namespace Database\Factories;

use App\Models\MembershipFee;
use Illuminate\Database\Eloquent\Factories\Factory;

class MembershipFeeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = MembershipFee::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'member_id' => $this->faker->randomDigitNotNull,
        'amount' => $this->faker->word,
        'start_date' => $this->faker->word,
        'end_date' => $this->faker->word,
        'date_created' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
