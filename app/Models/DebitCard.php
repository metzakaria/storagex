<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class DebitCard
 * @package App\Models
 * @version November 8, 2021, 3:40 pm UTC
 *
 * @property integer $member_id
 * @property string $card_no
 * @property string $expire
 * @property string $cvv
 * @property integer $issuing_bank
 * @property string $card_type
 * @property string|\Carbon\Carbon $datecreated
 */
class DebitCard extends Model
{

    use HasFactory;

    public $table = 'debit_cards';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';



    public $timestamps = false;
    
    public $fillable = [
        'member_id',
        'card_no',
        'expire',
        'cvv',
        'issuing_bank',
        'card_type',
        'datecreated'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'member_id' => 'integer',
        'card_no' => 'string',
        'expire' => 'string',
        'cvv' => 'string',
        'issuing_bank' => 'integer',
        'card_type' => 'string',
        'datecreated' => 'datetime'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'member_id' => 'nullable',
        'card_no' => 'nullable|string|max:255',
        'expire' => 'nullable|string|max:255',
        'cvv' => 'nullable|string|max:5',
        'issuing_bank' => 'nullable|integer',
        'card_type' => 'nullable|string|max:255',
        'datecreated' => 'nullable'
    ];
      /**
     * The "booted" method of the model.
     *
     * @return void
     */
    protected static function booted()
    {
        static::retrieved(function($debitcard) {
            $debitcard->card_no =  '******'.substr($debitcard->card_no, -4);
      });
    }

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
    public function issuingbank()
    {
        return $this->belongsTo(Bank::class, 'issuing_bank');
    }


    /**
     * get card image
     * 
     */
    public function getcardImg($card_type){
        if($card_type=="Visa"){
            return asset('images/visa-card.png');
        }elseif($card_type=="Master"){
            return asset('images/visa-card.png'); 
        }
        return asset('images/no-paycard.png');
    }
     /**
     * add extra attribute for view
     */
    public function toArray()
    {
        $array = parent::toArray();
        $array['card_image_url'] = $this->getcardImg($this->card_type);
        $array['issuing_bank'] = $this->issuingbank->bank_name;
        return $array;
    }
}
