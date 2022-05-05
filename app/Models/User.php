<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    public $timestamps = false;
    /**
     * The attributes that are mass assignable.
     *
     * @var string[]
     */
    protected $fillable = [
        'full_name',
        'phone',
        'email',
        'password',
        'role_id',
        'is_active',
        'last_login',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
/*
    protected $appends = array('availability');
    public function getAvailabilityAttribute()
    {
        return $this->calculateAvailability();  
    }*/
    /**
     * Get the role associated with the user.
     */
    public function role()
    {
        return $this->belongsTo(UserRole::class, 'role_id');
    }

    /**
     * Get the partner associated with the user.
     */
    public function partner()
    {
        return $this->hasOne(Partner::class, 'user_id');
    }

    /**
     * Get the member associated with the user.
     */
    public function member()
    {
        return $this->hasOne(Member::class, 'user_id');
    }


    /**
     * add extra attribute for view
     */
    public function toArray()
    {
        $array = parent::toArray();
        $array['rolecode'] = $this->role->role_code;
        return $array;
    }
       
    public function getUpperAttribute()    
    {
       return strtoupper($this->title);       
    }
}
