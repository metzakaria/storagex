<?php

namespace App\Models;

use Eloquent as Model;
<<<<<<< HEAD
=======
use DateTime;
>>>>>>> emmybranch

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class InvestmentProduct
 * @package App\Models
 * @version November 8, 2021, 3:38 pm UTC
 *
 * @property string $name
 * @property string $description
 * @property string $invest_type
 * @property string $unit_interest
 * @property string $unit_amount
 * @property string $quantity
 * @property string $image_file
 * @property string $qty_sold
 * @property boolean $is_active
 * @property integer $created_by
 * @property string $start_date
 * @property string $mature_date
 * @property string $location
 * @property integer $insurance_id
 * @property boolean $is_auctionable
 * @property string $provided_by
 * @property boolean $is_matured
 * @property integer $investors
 */
class InvestmentProduct extends Model
{

    use HasFactory;

    public $table = 'investment_products';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'name',
        'description',
        'invest_type',
        'unit_interest',
        'unit_amount',
        'quantity',
        'image_file',
        'qty_sold',
        'is_active',
        'created_by',
        'start_date',
        'mature_date',
        'location',
        'insurance',
        'is_auctionable',
        'provided_by',
        'is_matured',
        'investors'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'description' => 'string',
        'invest_type' => 'string',
        'unit_interest' => 'string',
        'unit_amount' => 'string',
        'quantity' => 'string',
        'image_file' => 'string',
        'qty_sold' => 'string',
        'is_active' => 'boolean',
        'created_by' => 'integer',
        'start_date' => 'date',
        'mature_date' => 'date',
        'location' => 'string',
        'insurance' => 'string',
        'is_auctionable' => 'boolean',
        'provided_by' => 'string',
        'is_matured' => 'boolean',
        'investors' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:255',
        'description' => 'required|string',
        'invest_type' => 'required|string|max:20',
        'unit_interest' => 'required|string|max:10',
        'unit_amount' => 'required|string|max:20',
        'quantity' => 'required|string|max:10',
        'image_file' => 'nullable|image|mimes:jpg,png,jpeg,gif',
        'qty_sold' => 'nullable|string|max:10',
        'is_active' => 'nullable|boolean',
        'created_by' => 'nullable|integer',
        'start_date' => 'required',
        'mature_date' => 'required',
        'location' => 'required',
        'insurance' => 'required|string',
        'created_at' => 'nullable',
        'updated_at' => 'nullable',
        'is_auctionable' => 'nullable|boolean',
        'provided_by' => 'nullable|string|max:255',
        'is_matured' => 'nullable|boolean',
        'investors' => 'nullable|integer'
    ];

    
    /**
     * get the count of investors
     */
    public function investors()
    {
        return  $this->hasMany(Investment::class,'product_id');
    }

    /**
     * get the count of investors
     */
    public function createdby()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    /**
     * get the count of investors
     */
    public function location()
    {
        return $this->belongsTo(Location::class, 'location');
    }
    /**
     * return sold out if qty is equal to sold
     */
    public function is_soldout(){
        if($this->quantity == $this->qty_sold){
            return "Yes";
        }
        return "No";
    } 

    /**
     * get today percent
     */
    public function interest_now(){
        $full_interest = $this->unit_interest/100;
        $full_duration = $this->duration();
        $interst_now = ( ($this->duration(true)*$full_interest) / $full_duration ) * 100;
        return $interst_now;
    }

    /** 
     * calculate ROI per unit
     */
    public function unit_roi($start_now = false, $unit_amount = ""){
        $_interest = $this->unit_interest/100;
        if($start_now){
            $_interest = $this->interest_now()/100; 
        }
        $_unit_amt = $this->unit_amount;
        if($unit_amount!=""){
            $_unit_amt = $unit_amount;
        }
        return ($_interest*$_unit_amt) + $_unit_amt;
    }


    /**
     * get duration
     */
    public function duration($start_now = false){
        $start = new DateTime($this->start_date);
        if($start_now){
            $start = new DateTime(date('Y-m-d'));  
        }
        $mature = new DateTime($this->mature_date);
        $interval = $mature->diff($start);
        $days = $interval->format('%a');
        return $days;
    }
    /**
     * add extra attribute for view
     */
    public function toArray()
    {
        $array = parent::toArray();
        $array['is_soldout'] = $this->is_soldout();
        return $array;
    }
    
}
