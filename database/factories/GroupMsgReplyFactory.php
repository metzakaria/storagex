<?php

namespace Database\Factories;

use App\Models\GroupMsgReply;
use Illuminate\Database\Eloquent\Factories\Factory;

class GroupMsgReplyFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = GroupMsgReply::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'group_msg_id' => $this->faker->randomDigitNotNull,
        'replied_message' => $this->faker->text,
        'replied_member' => $this->faker->randomDigitNotNull,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
