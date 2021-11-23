<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class GroupMember
 * @package App\Models
 * @version November 8, 2021, 3:39 pm UTC
 *
 * @property integer $group_id
 * @property integer $member_id
 * @property integer $group_owner_id
 * @property string|\Carbon\Carbon $date_created
 */
class GroupMember extends Model
{

    use HasFactory;

    public $table = 'group_members';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'group_id',
        'member_id',
        'group_owner_id',
        'date_created'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'group_id' => 'integer',
        'member_id' => 'integer',
        'group_owner_id' => 'integer',
        'date_created' => 'datetime'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'group_id' => 'nullable|integer',
        'member_id' => 'nullable|integer',
        'group_owner_id' => 'nullable|integer',
        'date_created' => 'required'
    ];

    
}
