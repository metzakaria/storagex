<?php

namespace Database\Factories;

use App\Models\FarmerStorage;
use Illuminate\Database\Eloquent\Factories\Factory;

class FarmerStorageFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = FarmerStorage::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'farmer_id' => $this->faker->randomDigitNotNull,
        'ware_house_id' => $this->faker->randomDigitNotNull,
        'commodity_id' => $this->faker->randomDigitNotNull,
        'qty' => $this->faker->word,
        'value_amount' => $this->faker->word,
        'receipt' => $this->faker->text,
        'date_receipt_generated' => $this->faker->date('Y-m-d H:i:s'),
        'is_removed' => $this->faker->word,
        'date_removed' => $this->faker->date('Y-m-d H:i:s'),
        'created_by' => $this->faker->randomDigitNotNull,
        'created_at' => $this->faker->date('Y-m-d H:i:s'),
        'updated_at' => $this->faker->date('Y-m-d H:i:s')
        ];
    }
}
