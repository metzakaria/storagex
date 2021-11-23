<?php

namespace Database\Factories;

use App\Models\GroupMember;
use Illuminate\Database\Eloquent\Factories\Factory;

class GroupMemberFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = GroupMember::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'group_id' => $this->faker->randomDigitNotNull,
        'member_id' => $this->faker->randomDigitNotNull,
        'group_owner_id' => $this->faker->randomDigitNotNull,
        'date_created' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
