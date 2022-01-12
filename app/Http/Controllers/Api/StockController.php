<?php

namespace App\Http\Controllers\Api;

use App\Models\StockCart;
use App\Models\StockItems;
use App\Models\TargetSaving;
use App\Models\StockMemberItems;
use App\Models\StockPurchase;
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
        StockCart::where('id',$request->id)->delete();
        $res = StockCart::where('member_id',Auth::user()->member->id);
        return $this->sendResponse($res, 'record updated successfully.');
    }
    
    public function showInterest(Request $request){
    
        $res = StockMemberItems::join('stockup_items', 'stockup_members_interest.stockup_item_id', '=', 'stockup_items.id')
        ->where('stockup_members_interest.member_id', Auth::user()->member->id)
        ->get(['stockup_items.*', 'stockup_members_interest.id']);
        
        return $this->sendResponse($res, 'record updated successfully.');
    }
    
    
    public function removeMemberInterest(Request $request){
    
        StockMemberItems::where('id',$request->id)->delete();
        
         $res = StockMemberItems::join('stockup_items', 'stockup_members_interest.stockup_item_id', '=', 'stockup_items.id')
        ->where('stockup_members_interest.member_id', Auth::user()->member->id)
        ->get(['stockup_items.*', 'stockup_members_interest.id']);
        
        return $this->sendResponse($res, 'record updated successfully.');
    }
    
    public function stockUpPurchase(Request $request){
        
        
       $validator = Validator::make($request->all(), [
            'password' => 'required',
            'answer' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }

        $input = $request->all();
        if(!Member::grantAccess(Auth::user()->member, $input['password'],$input['answer'])){
            return $this->sendError('Invalid password or security answer');
        }
        
        StockPurchase::create(['stockup_item_id' => $items,'member_id' => Auth::user()->member->id,'quantity_of_purchase' => $request->quantity_of_purchase
        ,'cost_per_unit' => $request->cost_per_unit,'total_cost' => $request->total_cost, 'delivery_phone_number'=>$request->delivery_phone_number, 
        'delivery_address'=>$request->delivery_address, 'delivery_contact_person'=> $request->delivery_contact_person, 'is_paid'=> '1', 
        'date_paid'=>$request->date_paid]);
         StockCart::where('member_id',Auth::user()->member->id)->delete();
         return $this->sendResponse([], 'record updated successfully.');
    }

}
