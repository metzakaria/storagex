<?php

namespace App\Models;

use Eloquent as Model;

use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class GroupMsgReply
 * @package App\Models
 * @version November 8, 2021, 3:39 pm UTC
 *
 * @property integer $group_msg_id
 * @property string $replied_message
 * @property integer $replied_member
 */
class GroupMsgReply extends Model
{

    use HasFactory;

    public $table = 'group_msg_replies';
    
    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';

    public $timestamps = false;


    public $fillable = [
        'group_msg_id',
        'replied_message',
        'replied_member'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'group_msg_id' => 'integer',
        'replied_message' => 'string',
        'replied_member' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'group_msg_id' => 'nullable|integer',
        'replied_message' => 'nullable|string',
        'replied_member' => 'nullable|integer',
        'created_at' => 'nullable',
        'updated_at' => 'nullable'
    ];

    
}
