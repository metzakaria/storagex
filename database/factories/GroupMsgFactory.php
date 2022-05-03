<?php

namespace Database\Factories;

use App\Models\GroupMsg;
use Illuminate\Database\Eloquent\Factories\Factory;

class GroupMsgFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = GroupMsg::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'group_id' => $this->faker->randomDigitNotNull,
        'message' => $this->faker->text,
        'created_menber' => $this->faker->randomDigitNotNull,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
