<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class GroupMsg
 * @package App\Models
 * @version November 8, 2021, 3:39 pm UTC
 *
 * @property integer $group_id
 * @property string $message
 * @property integer $created_menber
 */
class GroupMsg extends Model
{

    use HasFactory;

    public $table = 'group_msgs';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'group_id',
        'message',
        'created_menber'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'group_id' => 'integer',
        'message' => 'string',
        'created_menber' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'group_id' => 'nullable|integer',
        'message' => 'nullable|string',
        'created_menber' => 'nullable|integer',
        'created_at' => 'nullable',
        'updated_at' => 'nullable'
    ];

    
}
