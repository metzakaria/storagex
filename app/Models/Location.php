<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    use HasFactory;
     /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'locations';

    public $timestamps = false;
    /**
     * @var array
     */
    protected $fillable = ['name', 'shortname','created_at','updated_at'];


}
