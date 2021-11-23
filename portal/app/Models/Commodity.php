<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Commodity
 * @package App\Models
 * @version November 8, 2021, 2:50 pm UTC
 *
 * @property string $code
 * @property string $name
 * @property string $unit_measure
 */
class Commodity extends Model
{

    use HasFactory;

    public $table = 'commodities';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'code',
        'name',
        'unit_measure'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'code' => 'string',
        'name' => 'string',
        'unit_measure' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'code' => 'required|string|max:10',
        'name' => 'required|string|max:20',
        'unit_measure' => 'required|string|max:10',
    ];

    
}
