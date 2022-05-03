<?php

namespace Database\Factories;

use App\Models\Referral;
use Illuminate\Database\Eloquent\Factories\Factory;

class ReferralFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Referral::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'member_id' => $this->faker->randomDigitNotNull,
        'referred_member' => $this->faker->randomDigitNotNull,
        'commission' => $this->faker->word,
        'is_paid' => $this->faker->word,
        'date_paid' => $this->faker->date('Y-m-d H:i:s'),
        'date_created' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
