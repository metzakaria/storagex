<?php

namespace Database\Factories;

use App\Models\TargetSaving;
use Illuminate\Database\Eloquent\Factories\Factory;

class TargetSavingFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = TargetSaving::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'name' => $this->faker->word,
        'category_id' => $this->faker->randomDigitNotNull,
        'description' => $this->faker->text,
        'target_amt' => $this->faker->word,
        'cur_amt' => $this->faker->word,
        'prev_amt' => $this->faker->word,
        'yearly_interest' => $this->faker->word,
        'start_date' => $this->faker->word,
        'member_id' => $this->faker->randomDigitNotNull,
        'is_current' => $this->faker->word,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
