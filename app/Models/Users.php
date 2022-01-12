<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Users
 * @package App\Models
 * @version November 8, 2021, 3:35 pm UTC
 *
 * @property string $full_name
 * @property string $phone
 * @property string $email
 * @property string $password
 * @property integer $role_id
 * @property boolean $is_active
 * @property string|\Carbon\Carbon $last_login
 * @property string $remember_token
 */
class Users extends Model
{

    use HasFactory;

    public $table = 'users';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';




    public $fillable = [
        'full_name',
        'phone',
        'email',
        'password',
        'role_id',
        'is_active',
        'last_login',
        'remember_token'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'full_name' => 'string',
        'phone' => 'string',
        'email' => 'string',
        'password' => 'string',
        'role_id' => 'integer',
        'is_active' => 'boolean',
        'last_login' => 'datetime',
        'remember_token' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'full_name' => 'required|string|max:250',
        'phone' => 'nullable|string|max:14',
        'email' => 'required|string|max:255',
        'password' => 'required|string|max:255',
        'role_id' => 'required|integer',
        'is_active' => 'required|boolean',
        'last_login' => 'nullable',
        'remember_token' => 'nullable|string|max:100',
        'created_at' => 'nullable',
        'updated_at' => 'nullable'
    ];

    
}
