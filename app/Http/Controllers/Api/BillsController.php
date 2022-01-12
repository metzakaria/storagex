<?php /** @noinspection ALL */

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
use App\Models\BillPayment;
use Emmadedayo\VtPass\Model\VTClassicPurchase;
use Emmadedayo\VtPass\Model\VTModernPurchase;

class BillsController extends ApiController
{
    /**
     * Display a listing of the resource.
     *
     *
     */
     
     public function getAirtimeNetwork(Request $request){
          $result =  VTModernPurchase::getServiceID(['identifier'=>$request->type]);
          return $this->sendResponse($result['content'], 'Successfully.');
     }
     
     
    public function getBillsNetwork(Request $request){
          $result =  VTModernPurchase::getServiceID(['identifier'=>'tv-subscription']);
          $results =  VTModernPurchase::getServiceID(['identifier'=>'electricity-bill']);
          return $this->sendResponse(array_merge($result['content'],$results['content']), 'Successfully.');
     }
     
     
     public function getVariation(Request $request){
      $result =  VTModernPurchase::variations(['serviceID'=>$request->type]);
      return $this->sendResponse($result['content']['varations'], 'Successfully.');
     }
     
     public function verifySmartCard(Request $request){
       $result =  VTModernPurchase::verify(['billersCode'=>$request->billersCode,'serviceID'=>$request->serviceID, $request->type == ""?'':'type'=>$request->type]);
       return $this->sendResponse($result['content'], 'Successfully.');
     }
     
     public function buyService(Request $request){
         
       $validator = Validator::make($request->all(), [
            'password' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError($validator->errors()->first(), $validator->errors());
        }
        
        $model = Member::find(Auth::user()->member->id);
        if(!Member::grantAccess($model, $request['password'])){
            return $this->sendError('Invalid password entered');
        }
        
         $result =  VTModernPurchase::purchase([
                        'request_id' =>  rand(1000,9000),
                        'serviceID'   => $request->serviceID,
                        'phone'       => $request->phone,
                        'amount'      => $request->amount,
                        $request->variation_code == ""?'':'variation_code'=>$request->variation_code,
                        $request->billersCode == ""?'':'billersCode'=>$request->billersCode,
                        $request->subscription_type == ""?'':'subscription_type'=>$request->subscription_type,
                        $request->quantity == ""?'':'quantity'=>$request->quantity,
                        ]);
                        
            if ($result['code'] !== "000") {
                return $this->sendError("Opps,Error sending your request, try again later");
            } else {

                BillPayment::create([
                    'member_id' => Auth::user()->member->id,
                    'bill_type' => 'airtime',
                    'amount' => $request->amount,
                    'receiver_account' => $request->recepient,
                    'description' =>  $result['content']['transactions']["type"],
                    'is_paid' => '1',
                    'transaction_id' => $result['content']['transactions']["transactionId"],
                ]);
               
            }
     
        return $this->sendResponse([], 'Successfully.');
     }
     
}
