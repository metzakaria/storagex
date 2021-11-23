<?php

namespace Database\Factories;

use App\Models\DebitCard;
use Illuminate\Database\Eloquent\Factories\Factory;

class DebitCardFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = DebitCard::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'member_id' => $this->faker->word,
        'card_no' => $this->faker->word,
        'expire' => $this->faker->word,
        'cvv' => $this->faker->word,
        'issuing_bank' => $this->faker->randomDigitNotNull,
        'card_type' => $this->faker->word,
        'datecreated' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
