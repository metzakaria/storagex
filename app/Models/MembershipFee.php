<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class MembershipFee
 * @package App\Models
 * @version November 8, 2021, 3:26 pm UTC
 *
 * @property integer $member_id
 * @property string $amount
 * @property string $start_date
 * @property string $end_date
 * @property string|\Carbon\Carbon $date_created
 */
class MembershipFee extends Model
{

    use HasFactory;

    public $table = 'membership_fees';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'member_id',
        'amount',
        'start_date',
        'end_date',
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
        'amount' => 'string',
        'start_date' => 'date',
        'end_date' => 'date',
        'date_created' => 'datetime'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'member_id' => 'nullable|integer',
        'amount' => 'nullable|string|max:20',
        'start_date' => 'nullable',
        'end_date' => 'nullable',
        'date_created' => 'required'
    ];

    /**
     * Get the member_id associated .
     */
    public function member()
    {
        return $this->belongsTo(Member::class, 'member_id');
    }
}
