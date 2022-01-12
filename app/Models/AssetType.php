<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssetType extends Model
{
    use HasFactory;

    public $table = 'asset_types';
    

    public $timestamps = false;

    public $fillable = [
        'name',
    ];
}
