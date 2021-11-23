<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class RegularSaving
 * @package App\Models
 * @version November 8, 2021, 3:36 pm UTC
 *
 * @property integer $member_id
 * @property string $amount
 * @property string $frequency
 * @property string $default_payment_method
 * @property boolean $autosave
 */
class RegularSaving extends Model
{

    use HasFactory;

    public $table = 'regular_savings';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    public $timestamps = false;

    public $fillable = [
        'member_id',
        'amount',
        'frequency',
        'default_payment_method',
        'autosave'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'member_id' => 'integer',
        'amount' => 'string',
        'frequency' => 'string',
        'default_payment_method' => 'string',
        'autosave' => 'boolean'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'member_id' => 'nullable',
        'amount' => 'nullable|string|max:20',
        'frequency' => 'nullable|string|max:20',
        'default_payment_method' => 'nullable|string|max:20',
        'autosave' => 'nullable|boolean',
        'created_at' => 'nullable'
    ];

    
    /**
     * return member 
     */
    public function member()
    {
        return $this->belongsTo(Member::class, 'member_id');
    }
}
