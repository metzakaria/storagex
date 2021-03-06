<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

/**
 * Class RegularSavingsTransaction
 * @package App\Models
 * @version November 8, 2021, 3:36 pm UTC
 *
 * @property string $transaction_ref
 * @property string $description
 * @property string $amount
 * @property string $dr_cr
 * @property string|\Carbon\Carbon $date_transaction
 * @property boolean $bal_affected
 * @property integer $member_id
 * @property string $pay_method
 */
class RegularSavingsTransaction extends Model
{

    use HasFactory;

    public $table = 'target_savings_transactions';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    public $timestamps = false;

    public $fillable = [
        'transaction_ref',
        'target_id',
        'description',
        'amount',
        'dr_cr',
        'date_transaction',
        'bal_affected',
        'member_id',
        'pay_method'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'transaction_ref' => 'string',
        'description' => 'string',
        'amount' => 'string',
        'dr_cr' => 'string',
        'date_transaction' => 'datetime',
        'bal_affected' => 'boolean',
        'member_id' => 'integer',
        'pay_method' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'transaction_ref' => 'required|string|max:255',
        'description' => 'nullable|string',
        'amount' => 'nullable|string|max:20',
        'dr_cr' => 'nullable|string|max:4',
        'date_transaction' => 'required',
        'bal_affected' => 'required|boolean',
        'member_id' => 'nullable',
        'pay_method' => 'nullable|string|max:10'
    ];

    /**
     * The "booted" method of the model.
     *
     * @return void
     */
    protected static function booted()
    {
        static::creating(function ($transactions) {
            $transactions->transaction_ref = "44444444";
        });
    }

     /**
     * Get the member_id associated .
     */
    public function member()
    {
        return $this->belongsTo(Member::class, 'member_id');
    }
}
