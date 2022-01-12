<?php

namespace App\Http\Controllers\Api;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\ApiController as ApiController;
use Illuminate\Support\Facades\Auth;
use Validator;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Member;
use App\Models\UserRole;
use App\Models\Referral;
   
class UserController extends ApiController
{
  
    /**
     * user registration/ create
     */
    public function createMemberUser(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required',
            'confirm_password' => 'required|same:password',
        ]);
   
        if($validator->fails()){
            return $this->sendError($validator->errors()->first(), $validator->errors());       
        }
        
        $success = [];
        $input = $request->all();
        $input['role_id'] = UserRole::getRowByCode("MEMBER")->id;
        $input['is_active'] = 1;
        $input['password'] = Hash::make($input['password']);
        try{
            DB::transaction(function() use ($input,&$success)  {
                $user = User::create($input);
                $member = Member::create([
                    'full_name'     => $user->full_name,
                    'email'         => $user->email,
                    'mobile'        => $user->mobile,
                    'is_active'     => 1,
                    'referral_code' => Member::makeReferralCode(),
                    'user_id'       => $user->id,
                ]);
                //check for referral here 
                $refer_by = Member::where('referral_code', $input['referral_code'])->first();
                if($refer_by ){
                    $refered = Referral::firstOrCreate(
                        [
                            'referred_member'   => $member->id,
                        ],
                        [
                            'member_id'         => $refer_by->id,
                            'referred_member'   => $member->id,
                            'commission'        => '100',
                        ]
                    );        
                }
                $success['token'] =  $user->createToken('MyAuthApp')->plainTextToken;
                $success['name'] =  $user->full_name;
                $success['user_id'] =  $user->id;
                $success['member'] =  $member;
            });

            return $this->sendResponse($success, 'User created successfully.');

        } catch (Exception $e) {
            return $this->sendError('Error creating member', $e->getMessage()); 
        }
        
    }

   

    /**
     * change  user password
     */
    public function changePassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            //'new_password' => 'required|min:6',
            'new_password' => 'required',
            'user_id' => 'required',
            'confirm_newpassword' => 'required|same:new_password',
        ]);
   
        if($validator->fails()){
            return $this->sendError($validator->errors()->first(), $validator->errors());       
        }
        $input = $request->all();
        $user = User::find($input['user_id']);
        if($user){
            if ((Hash::check(request('old_password'), $user->password)) == false) {
                return $this->sendError('old password is invalid ');
            } else {
                User::where('id', $input['user_id'])->update(['password' => Hash::make($input['new_password'])]);
                return $this->sendResponse([], 'Password changed successfully.');
            }
        }
        return $this->sendError('User Id not found ');
    }

    /**
     * forgot user password
     */
    public function forgotPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required'
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
        $input = $request->all();
        $user = User::where('email', $input['email'])->first();
        if($user){
            $newpass = Str::random(7);
            $user->password = Hash::make($newpass);
            if($user->save()){
                //send email with new password
            }
            return $this->sendResponse([], 'Password send to your email.');
        }
        return $this->sendError('Email not found ');
    }

    /**
     * list single user
     */
    public function show($id)
    {   
        $user = User::find($id);
        if($user){
            $user->makeHidden(['role_id']);
            return $this->sendResponse($user, 'Successfully.');
        }
        return $this->sendError('User not found.');
    }

  

    /**
     * user login 
     */
    public function login(Request $request)
    {
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){ 
            $authUser = Auth::user(); 
            $success['token'] =  $authUser->createToken('MyAuthApp')->plainTextToken; 
            $success['name'] =  $authUser->full_name;
            $success['user_id'] =  $authUser->id;
            $success['member'] =  $authUser->member->toArray();
            $authUser->last_login = Carbon::now();
            $authUser->save();
            return $this->sendResponse($success, 'User signed in');
        }else{ 
            return $this->sendError('Unauthorised.', ['error'=>'Unauthorised']);
        } 
    }

}

