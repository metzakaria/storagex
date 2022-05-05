<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockupPurchase extends Model
{
    use HasFactory;

    protected $table="stockup_purchases";

    protected $guards = [];


    public static $rules = [
        'stockup_item_id'=>'required',
        'member_id' => 'required'
    ];
}
