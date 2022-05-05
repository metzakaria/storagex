<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Api\ApiController as ApiController;
use Illuminate\Support\Facades\Auth;
use Validator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\FarmerStorage;
use App\Models\Farmer;

   
class PartnerController extends ApiController
{   
    /**
     * get ware house receipt 
     */
    public function showWarehouseReceipts()
    {   
        $storage = FarmerStorage::all();
        $storage->makeHidden(['farmer_id','ware_house_id','commodity_id','created_by']);
        return $this->sendResponse($storage, 'Successfully.');

    }


    /**
     * get farmers  
     */
    public function showFarmers()
    {   
        $farmers = Farmer::all();
        $farmers->makeHidden(['state_id','lga_id','location_id','created_by']);
        return $this->sendResponse($farmers, 'Successfully.');

    }

    /**
     * user login 
     */
    public function login(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
        $user = User::where(['email'=>$request['email']])->first();
        if($user){
            if ((Hash::check(request('password'), $user->password)) == false) {
                return $this->sendError('Password is invalid ');
            } else if($user->role->role_code != 'PARTNER') {
                return $this->sendError('Error accessing resources');   
            }else{
                $success['token'] =  $user->createToken('MyAuthApp')->plainTextToken; 
                $success['name'] =  $user->full_name;
                $success['partner_id'] =  @$user->partner->id;
                $user->last_login = Carbon::now();
                $user->save();
                return $this->sendResponse($success, 'User signed in');
            }
        }
        return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
       
    }

}

