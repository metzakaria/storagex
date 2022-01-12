<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SavingType extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'savings_type';

    public $timestamps = false;
    /**
     * @var array
     */
    protected $fillable = ['name','description','yearly_interest'];
}
