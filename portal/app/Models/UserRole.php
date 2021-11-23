<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserRole extends Model
{
    use HasFactory;
       /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'user_roles';

    public $timestamps = false;
    /**
     * @var array
     */
    protected $fillable = ['role', 'role_code'];

    //return role id by code
    public static function getRowByCode($code){
      return UserRole::where('role_code',$code )->first();
    }

}
