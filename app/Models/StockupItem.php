<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockupItem extends Model
{
    use HasFactory;

        /**
     * The table associated with the model.
     *
     * @var string
     */

    protected $table = 'stockup_items';

    public $timestamps = false;

     /**
     * @var array
     */
    protected $fillable = ['item_name','quantity','price_per_unit', 'item_image', 'unit', 'in_stock','description'];

    public static $rules = [
        'item_name' => 'required',
        'quantity' => 'required'
    ];
}
