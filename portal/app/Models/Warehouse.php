<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Warehouse
 * @package App\Models
 * @version November 8, 2021, 3:35 pm UTC
 *
 * @property string $name
 * @property string $description
 * @property integer $location_id
 * @property integer $state_id
 * @property integer $lga_id
 * @property string $insurance
 * @property string $policy_number
 */
class Warehouse extends Model
{

    use HasFactory;

    public $table = 'warehouses';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'name',
        'description',
        'location_id',
        'state_id',
        'lga_id',
        'insurance',
        'policy_number'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'description' => 'string',
        'location_id' => 'integer',
        'state_id' => 'integer',
        'lga_id' => 'integer',
        'insurance' => 'string',
        'policy_number' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:255',
        'description' => 'nullable|string',
        'location_id' => 'required|integer',
        'insurance' => 'nullable|string|max:255',
        'policy_number' => 'nullable|string|max:255'
    ];

    /**
     * return location 
     */
    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }
    
}
