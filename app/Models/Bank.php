<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Bank
 * @package App\Models
 * @version November 10, 2021, 10:20 pm UTC
 *
 * @property string $bank_name
 * @property string $short_name
 */
class Bank extends Model
{

    use HasFactory;

    public $table = 'banks';
    

    public $timestamps = false;

    public $fillable = [
        'bank_name',
        'short_name'
    ];

    /**
     * added ftp syn
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'bank_name' => 'string',
        'short_name' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        
    ];

    
}
