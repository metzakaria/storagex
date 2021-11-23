<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Partner
 * @package App\Models
 * @version November 8, 2021, 3:37 pm UTC
 *
 * @property string $partner_name
 * @property integer $state_id
 * @property integer $lga_id
 * @property string $email
 * @property string $phone
 * @property string $address
 * @property string $other_info
 * @property integer $asset_type_id
 * @property integer $insurance_id
 * @property integer $user_id
 */
class Partner extends Model
{

    use HasFactory;

    public $table = 'partners';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    public $timestamps = false;

    public $fillable = [
        'partner_name',
        'location_id',
        'email',
        'phone',
        'address',
        'other_info',
        'asset_type_id',
        'insurance',
        'user_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'partner_name' => 'string',
        'location_id' => 'integer',
        'email' => 'string',
        'phone' => 'string',
        'address' => 'string',
        'other_info' => 'string',
        'asset_type_id' => 'integer',
        'insurance' => 'string',
        'user_id' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'partner_name' => 'required|string|max:255',
        'email' => 'nullable|string|max:255',
        'phone' => 'required|string|max:255',
        'location_id' => 'nullable|string',
        'address' => 'required|string',
        'asset_type_id' => 'required|integer',
        'insurance' => 'nullable|string',
    ];

    /**
     * return location 
     */
    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }


    /**
     * return asset 
     */
    public function assettype()
    {
        return $this->belongsTo(AssetType::class, 'asset_type_id');
    }
}
