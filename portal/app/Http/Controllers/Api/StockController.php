<?php

namespace App\Http\Controllers\Api;

use App\Models\StockCart;
use App\Models\StockItems;
use App\Models\TargetSaving;
use App\Models\TargetSavingCat;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Validator;
use Illuminate\Http\Request;
use App\Models\SavingType;
use App\Models\RegularSaving;
use App\Models\RegularSavingsTransaction;
use App\Models\Member;
use App\Models\DebitCard;

class StockController extends ApiController
{


    public function indexListStockItems()
    {
        $res = StockItems::get();
        return $this->sendResponse($res, 'Successfully.');
    }


    public function storeMemberInterest(Request $request)
    {
        foreach ($request->stockItems as $items){
            StockMemberItems::create([
                'stockup_item_id' => $items,
                'member_id' => Auth::user()->member->id,
                'period' => 1,
            ]);
        }
        return $this->sendResponse([], 'record updated successfully.');
    }

    public function storeCart(Request $request)
    {
        //
        StockCart::create([
            'stockup_item_id' => $request->stockItemId,
            'member_id' => Auth::user()->member->id,
            'qty' => $request->qty,
            'checkout' => 1,
        ]);
        return $this->sendResponse([], 'record updated successfully.');
    }


    public function showCart(Request $request)
    {
        //
        $res = StockCart::where('member_id',Auth::user()->member->id);
        return $this->sendResponse($res, 'record updated successfully.');
    }

    public function deleteCart(Request $request)
    {
        //
        $res = StockCart::where('id',$request->id)->delete();
        return $this->sendResponse($res, 'record updated successfully.');
    }

    public function stockUpPurchase(Request $request){

    }

}
