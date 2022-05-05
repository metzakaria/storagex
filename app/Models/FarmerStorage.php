<?php

namespace App\Models;
use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class FarmerStorage
 * @package App\Models
 * @version November 8, 2021, 3:40 pm UTC
 *
 * @property integer $farmer_id
 * @property integer $ware_house_id
 * @property integer $commodity_id
 * @property string $qty
 * @property string $value_amount
 * @property string $receipt
 * @property string|\Carbon\Carbon $date_receipt_generated
 * @property boolean $is_removed
 * @property string|\Carbon\Carbon $date_removed
 * @property integer $created_by
 */
class FarmerStorage extends Model
{

    use HasFactory;

    public $table = 'farmer_storages';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'farmer_id',
        'ware_house_id',
        'commodity_id',
        'qty',
        'price',
        'value_amount',
        'receipt',
        'date_receipt_generated',
        'is_removed',
        'date_removed',
        'created_by'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'farmer_id' => 'integer',
        'ware_house_id' => 'integer',
        'commodity_id' => 'integer',
        'qty' => 'string',
        'price' => 'string',
        'value_amount' => 'string',
        'receipt' => 'string',
        'date_receipt_generated' => 'datetime',
        'is_removed' => 'boolean',
        'date_removed' => 'datetime',
        'created_by' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'farmer_id' => 'required|integer',
        'ware_house_id' => 'required|integer',
        'commodity_id' => 'required|integer',
        'qty' => 'required|string|max:10',
        'price' => 'required|string',
    ];

      /**
     * The "booted" method of the model.
     *
     * @return void
     */
    protected static function booted()
    {
        static::saving(function ($farmerstorage) {
            $farmerstorage->created_by = \Auth::user()->id;
            $farmerstorage->receipt = $farmerstorage->generateReceipt();
            $farmerstorage->value_amount = $farmerstorage->price * $farmerstorage->qty;
        });
    }

    /**
     * return farmer 
     */
    public function farmer()
    {
        return $this->belongsTo(Farmer::class, 'farmer_id');
    }

    /**
     * return warehouse 
     */
    public function warehouse()
    {
        return $this->belongsTo(Warehouse::class, 'ware_house_id');
    }

    /**
     * return commodity 
     */
    public function commodity()
    {
        return $this->belongsTo(Commodity::class, 'commodity_id');
    }

    /**
     * return created by 
     */
    public function createdby()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    /**
     * generate receipts
     */
    public function generateReceipt(){
        $receipt = "SXEWR ".$this->farmer->reg_number." ".$this->commodity->code." ".date('dmy')." ".$this->warehouse->location->shortname." ".$this->qty;
        return $receipt;
    }
    /**
     * add extra attribute for view
     */
    public function toArray()
    {
        $array = parent::toArray();
        $array['farmer_name'] = $this->farmer->full_name;
        $array['farmer_reg_no'] = $this->farmer->reg_number;
        $array['commodity_store'] = $this->commodity->name;
        $array['warehouse_location'] = $this->warehouse->location->name;
        $array['insurance'] = $this->warehouse->insurance;
        $array['policy_number'] = $this->warehouse->policy_number;
        return $array;
    }
    
}
