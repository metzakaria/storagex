<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Group
 * @package App\Models
 * @version November 8, 2021, 3:38 pm UTC
 *
 * @property string $name
 * @property integer $state_id
 * @property integer $lga_id
 * @property integer $created_menber
 */
class Group extends Model
{

    use HasFactory;

    public $table = 'groups';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    public $timestamps = false;

    public $fillable = [
        'name',
        'state_id',
        'lga_id',
        'created_menber'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'state_id' => 'integer',
        'lga_id' => 'integer',
        'created_menber' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:255',
        'state_id' => 'nullable|integer',
        'lga_id' => 'nullable|integer',
        'created_menber' => 'nullable|integer',
        'created_at' => 'nullable',
        'updated_at' => 'nullable'
    ];

    
}
