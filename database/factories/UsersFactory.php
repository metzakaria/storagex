<?php

namespace Database\Factories;

use App\Models\Users;
use Illuminate\Database\Eloquent\Factories\Factory;

class UsersFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Users::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'full_name' => $this->faker->word,
        'phone' => $this->faker->word,
        'email' => $this->faker->word,
        'password' => $this->faker->word,
        'role_id' => $this->faker->randomDigitNotNull,
        'is_active' => $this->faker->word,
        'last_login' => $this->faker->date('Y-m-d H:i:s'),
        'remember_token' => $this->faker->word,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
