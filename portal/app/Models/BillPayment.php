<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class BillPayment
 * @package App\Models
 * @version November 8, 2021, 3:40 pm UTC
 *
 * @property integer $member_id
 * @property string $bill_type
 * @property string $amount
 * @property string $fee
 * @property string $receiver_account
 * @property string $description
 * @property boolean $is_paid
 * @property string $date_paid
 * @property string|\Carbon\Carbon $date_created
 */
class BillPayment extends Model
{

    use HasFactory;

    public $table = 'bill_payments';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'member_id',
        'bill_type',
        'amount',
        'fee',
        'receiver_account',
        'description',
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
        'bill_type' => 'string',
        'amount' => 'string',
        'fee' => 'string',
        'receiver_account' => 'string',
        'description' => 'string',
        'is_paid' => 'boolean',
        'date_paid' => 'date',
        'date_created' => 'datetime'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'member_id' => 'nullable',
        'bill_type' => 'nullable|string|max:255',
        'amount' => 'nullable|string|max:20',
        'fee' => 'nullable|string|max:20',
        'receiver_account' => 'nullable|string|max:255',
        'description' => 'nullable|string',
        'is_paid' => 'required|boolean',
        'date_paid' => 'nullable',
        'date_created' => 'required'
    ];

    
}
