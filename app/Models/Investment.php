<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Investment
 * @package App\Models
 * @version November 8, 2021, 3:37 pm UTC
 *
 * @property integer $invest_product_id
 * @property integer $member_id
 * @property string $qty_bought
 * @property string $amt_bought
 * @property string|\Carbon\Carbon $date_invest
 * @property string $expect_amt_return
 * @property boolean $is_auctioned
 * @property integer $auction_id
 * @property boolean $t_n_c
 * @property string $payment_method
 */
class Investment extends Model
{

    use HasFactory;

    public $table = 'investments';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'invest_product_id',
        'member_id',
        'qty_bought',
        'amt_bought',
        'date_invest',
        'expect_amt_return',
        'is_auctioned',
        'auction_id',
        't_n_c',
        'payment_method'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'invest_product_id' => 'integer',
        'member_id' => 'integer',
        'qty_bought' => 'string',
        'amt_bought' => 'string',
        'date_invest' => 'datetime',
        'expect_amt_return' => 'string',
        'is_auctioned' => 'boolean',
        'auction_id' => 'integer',
        't_n_c' => 'boolean',
        'payment_method' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'invest_product_id' => 'required|integer',
        'member_id' => 'required|integer',
        'qty_bought' => 'required|string|max:10',
        'amt_bought' => 'required|string|max:20',
        'date_invest' => 'required',
        'expect_amt_return' => 'nullable|string|max:20',
        'is_auctioned' => 'required|boolean',
        'auction_id' => 'nullable|integer',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        't_n_c' => 'nullable|boolean',
        'payment_method' => 'nullable|string|max:20'
    ];


    /**
     * The "booted" method of the model.
     *
     * @return void
     */
    protected static function booted()
    {
        static::creating(function ($transactions) {
           // $transactions->transaction_ref = "44444444";
        });
    }

    /**
     * get the member that has the investment
     */
    public function member(){
        return $this->belongsTo(Member::class, 'member_id');
    }

    /**
     * get the investment product
     */
    public function investmentproduct()
    {
        return $this->belongsTo(InvestmentProduct::class, 'invest_product_id');
    }

    /**
     * get the investment auctions
     */
    public function auctions()
    {
        return $this->hasMany(InvestmentAuction::class, 'investment_id');
    }
    /**
     * add extra attribute for view
     */
<<<<<<< HEAD
    public function toArray()
    {
        $array = parent::toArray();
        $array['product_name'] = $this->investor_product->name;
        $array['product_description'] = $this->investor_product->description;
        $array['product_image'] = $this->investor_product->image_file;
        $array['product_unit_interest'] = $this->investor_product->unit_interest;
        $array['product_unit_price'] = $this->investor_product->unit_amount;
        $array['product_soldout'] = $this->investor_product->is_soldout();
        $array['product_unit_startdate'] = $this->investor_product->start_date;
        $array['product_unit_enddate'] = $this->investor_product->end_date;
        return $array;
    }
    
=======
     
    protected $appends = ['investment'];
    
    public function getInvestmentAttribute(){
        
        $db = InvestmentProduct::where('id',$this->invest_product_id)->get();
        return $db;
        
    }
    
    // public function toArray()
    // {
    //     $array = parent::toArray();
    //     $array['product_name'] = $this->investor_product->name;
    //     $array['product_description'] = $this->investor_product->description;
    //     $array['product_image'] = $this->investor_product->image_file;
    //     $array['product_unit_interest'] = $this->investor_product->unit_interest;
    //     $array['product_unit_price'] = $this->investor_product->unit_amount;
    //     $array['product_soldout'] = $this->investor_product->is_soldout();
    //     $array['product_unit_startdate'] = $this->investor_product->start_date;
    //     $array['product_unit_enddate'] = $this->investor_product->end_date;
    //     return $array;
    // }
    
>>>>>>> emmybranch
}
