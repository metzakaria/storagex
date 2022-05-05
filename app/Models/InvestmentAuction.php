<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\InvestmentProduct;
use App\Models\Investment;

/**
 * Class InvestmentAuction
 * @package App\Models
 * @version November 8, 2021, 3:38 pm UTC
 *
 * @property integer $investment_id
 * @property integer $invest_product_id
 * @property string $qty_offer
 * @property string $unit_amount
 * @property string $total_amount
 * @property boolean $is_sold
 * @property string|\Carbon\Carbon $date_sold
 * @property integer $boughtby_member
 * @property string|\Carbon\Carbon $date_created
 * @property string|\Carbon\Carbon $offer_close_at
 * @property boolean $t_n_c
 */
class InvestmentAuction extends Model
{

    use HasFactory;

    public $table = 'investment_auctions';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'investment_id',
        'invest_product_id',
        'qty_offer',
        'unit_amount',
        'total_amount',
        'is_sold',
        'date_sold',
        'boughtby_member',
        'date_created',
        'offer_close_at',
        't_n_c'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'investment_id' => 'integer',
        'invest_product_id' => 'integer',
        'qty_offer' => 'string',
        'unit_amount' => 'string',
        'total_amount' => 'string',
        'is_sold' => 'boolean',
        'date_sold' => 'datetime',
        'boughtby_member' => 'integer',
        'date_created' => 'datetime',
        'offer_close_at' => 'datetime',
        't_n_c' => 'boolean'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'investment_id' => 'required|integer',
        'invest_product_id' => 'required|integer',
        'qty_offer' => 'required|string|max:10',
        'unit_amount' => 'required|string|max:20',
        'total_amount' => 'nullable|string|max:20',
        'is_sold' => 'required|boolean',
        'date_sold' => 'nullable',
        'boughtby_member' => 'nullable|integer',
        'date_created' => 'required',
        'offer_close_at' => 'nullable',
        't_n_c' => 'nullable|boolean'
    ];

    /**
     * get investment relation
     */
    public function investment(){
        return $this->belongsTo(Investment::class, 'investment_id');
      }
  
      /**
       * get investment product relation
       */
      public function investment_product(){
        return $this->belongsTo(InvestmentProduct::class, 'invest_product_id');
      }
      

       /**
       * get investment product relation
       */
      public function boughtbymember(){
        return $this->belongsTo(Member::class, 'boughtby_member');
      }
      /**
       * add extra attribute for view
       */
      public function toArray()
      {
          $array = parent::toArray();
          $array['offer_by'] = $this->investment->member->full_name;
          $array['unit_interest'] = $this->investment_product->interest_now();
          return $array;
      }
      
}
