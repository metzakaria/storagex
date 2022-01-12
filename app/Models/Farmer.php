<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Farmer
 * @package App\Models
 * @version November 8, 2021, 3:41 pm UTC
 *
 * @property string $reg_number
 * @property string $full_name
 * @property integer $state_id
 * @property integer $lga_id
 * @property integer $location_id
 * @property string $photo
 * @property string $email
 * @property string $mobile
 * @property string $address
 * @property string $produce_description
 * @property integer $created_by
 */
class Farmer extends Model
{

    use HasFactory;

    public $table = 'farmers';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'reg_number',
        'full_name',
        'state_id',
        'lga_id',
        'location_id',
        'photo',
        'email',
        'mobile',
        'address',
        'produce_description',
        'created_by'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'reg_number' => 'string',
        'full_name' => 'string',
        'state_id' => 'integer',
        'lga_id' => 'integer',
        'location_id' => 'integer',
        'photo' => 'string',
        'email' => 'string',
        'mobile' => 'string',
        'address' => 'string',
        'produce_description' => 'string',
        'created_by' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'reg_number' => 'required|string|max:10',
        'full_name' => 'required|string|max:200',
        'location_id' => 'required|integer',
        'photo' =>  'nullable|image|mimes:jpg,png,jpeg,gif',
        'email' => 'nullable|string|max:255',
        'mobile' => 'nullable|string|max:14',
        'produce_description' => 'nullable|string',
    ];

    /**
     * return location 
     */
    public function location()
    {
        return $this->belongsTo(Location::class, 'location_id');
    }

    /**
     * return state 
     */
    public function state()
    {
        return $this->belongsTo(State::class, 'state_id');
    }


     /**
     * return lga 
     */
    public function lga()
    {
        return $this->belongsTo(Lga::class, 'lga_id');
    }

     /**
     * add extra attribute for view
     */
    public function toArray()
    {
        $array = parent::toArray();
        $array['state'] = @$this->state->state;
        $array['lga'] = @$this->lga->name;
        $array['location'] = @$this->location->name;
        $array['photo_url'] = '';
        return $array;
    }

    
}
