<?php

namespace Database\Factories;

use App\Models\Member;
use Illuminate\Database\Eloquent\Factories\Factory;

class MemberFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Member::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'full_name' => $this->faker->word,
        'state_id' => $this->faker->randomDigitNotNull,
        'lga_id' => $this->faker->randomDigitNotNull,
        'photo' => $this->faker->word,
        'email' => $this->faker->word,
        'mobile' => $this->faker->word,
        'address' => $this->faker->text,
        'security_question' => $this->faker->word,
        'security_ans' => $this->faker->word,
        'bvn' => $this->faker->word,
        'bank_id' => $this->faker->randomDigitNotNull,
        'account_no' => $this->faker->word,
        'account_name' => $this->faker->word,
        'is_bank_verified' => $this->faker->word,
        'dob' => $this->faker->word,
        'identity_type_id' => $this->faker->randomDigitNotNull,
        'identity_image' => $this->faker->word,
        'is_active' => $this->faker->word,
        'is_deleted' => $this->faker->word,
        'referral_code' => $this->faker->word,
        'cur_bal' => $this->faker->word,
        'prev_bal' => $this->faker->word,
        'user_id' => $this->faker->randomDigitNotNull,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s'),
        'cur_invest_bal' => $this->faker->word,
        'prev_invest_bal' => $this->faker->word,
        'storagex_bank_id' => $this->faker->randomDigitNotNull,
        'storagex_acct_no' => $this->faker->word,
        'disable_wallet_bal' => $this->faker->word
        ];
    }
}
