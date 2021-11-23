<?php

namespace App\Models;

use Eloquent as Model;
use App\Models\Member;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class TargetSaving
 * @package App\Models
 * @version November 8, 2021, 3:36 pm UTC
 *
 * @property string $name
 * @property integer $category_id
 * @property string $description
 * @property string $target_amt
 * @property string $cur_amt
 * @property string $prev_amt
 * @property string $yearly_interest
 * @property string $start_date
 * @property integer $member_id
 * @property boolean $is_current
 */
class TargetSaving extends Model
{

    use HasFactory;

    public $table = 'target_savings';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'name',
        'category_id',
        'description',
        'target_amt',
        'cur_amt',
        'prev_amt',
        'yearly_interest',
        'start_date',
        'member_id',
        'is_current'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'category_id' => 'integer',
        'description' => 'string',
        'target_amt' => 'string',
        'cur_amt' => 'string',
        'prev_amt' => 'string',
        'yearly_interest' => 'string',
        'start_date' => 'date',
        'member_id' => 'integer',
        'is_current' => 'boolean'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:255',
        'category_id' => 'nullable|integer',
        'description' => 'nullable|string',
        'target_amt' => 'nullable|string|max:20',
        'cur_amt' => 'nullable|string|max:20',
        'prev_amt' => 'nullable|string|max:20',
        'yearly_interest' => 'nullable|string|max:20',
        'start_date' => 'nullable',
        'member_id' => 'required|integer',
        'is_current' => 'required|boolean',
        'created_at' => 'nullable',
        'updated_at' => 'nullable'
    ];

    /**
     * Get the category_id associated .
     */
    public function category()
    {
        return $this->belongsTo(TargetSavingCat::class, 'category_id');
    }

     /**
     * Get the member_id associated .
     */
    public function member()
    {
        return $this->belongsTo(Member::class, 'member_id');
    }
    
}
