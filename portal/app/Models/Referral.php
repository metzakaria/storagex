<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Referral
 * @package App\Models
 * @version November 8, 2021, 3:37 pm UTC
 *
 * @property integer $member_id
 * @property integer $referred_member
 * @property string $commission
 * @property boolean $is_paid
 * @property string|\Carbon\Carbon $date_paid
 * @property string|\Carbon\Carbon $date_created
 */
class Referral extends Model
{

    use HasFactory;

    public $table = 'referrals';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'member_id',
        'referred_member',
        'commission',
        'is_paid',
        'date_paid',
        'date_created'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'member_id' => 'integer',
        'referred_member' => 'integer',
        'commission' => 'string',
        'is_paid' => 'boolean',
        'date_paid' => 'datetime',
        'date_created' => 'datetime'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'member_id' => 'nullable|integer',
        'referred_member' => 'nullable|integer',
        'commission' => 'nullable|string|max:255',
        'is_paid' => 'required|boolean',
        'date_paid' => 'nullable',
        'date_created' => 'required'
    ];

    /**
     * Get the member_id associated .
     */
    public function member()
    {
        return $this->belongsTo(Member::class, 'member_id');
    }

    /**
     * Get the member_id associated .
     */
    public function referredmember()
    {
        return $this->belongsTo(Member::class, 'referred_member');
    }
    
}
