<?php

namespace App\Http\Controllers\Api;

<<<<<<< HEAD
use Illuminate\Http\Request;
use App\Http\Controllers\Api\ApiController as ApiController;
use Illuminate\Support\Facades\Auth;
use Validator;
=======
use App\Models\RegularSavingsTransaction;
use App\Models\UserModel;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\ApiController as ApiController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
>>>>>>> emmybranch
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\Member;
use App\Models\UserRole;
use App\Models\DebitCard;
use App\Models\Util;
use App\Models\Bank;
use App\Models\MembershipFee;

<<<<<<< HEAD
   
=======

>>>>>>> emmybranch
class MemberController extends ApiController
{
  /**
     * list single member by id
     */
<<<<<<< HEAD
    public function showById($id)
    {   
        $member = Member::find($id);
=======
    public function showById()
    {
        $member = Member::find(Auth::user()->member->id);
>>>>>>> emmybranch
        if($member){
            return $this->sendResponse($member, 'Successfully.');
        }
        return $this->sendError('Member record not found validation');
    }

    /**
     * list single member by userid
     */
    public function showByUserId($userid)
<<<<<<< HEAD
    {   
=======
    {
>>>>>>> emmybranch
        $member = Member::where("user_id",$userid)->first();
        if($member){
            return $this->sendResponse($member, 'Successfully.');
        }
        return $this->sendError('Member record not found validation');
    }

    /**
<<<<<<< HEAD
     * bank account validation 
     */
    public function validateBankAccount(Request $request)
    {   
=======
     * bank account validation
     */
    public function validateBankAccount(Request $request)
    {
>>>>>>> emmybranch
        $validator = Validator::make($request->all(), [
            'bank_id' =>  'required|exists:banks,id',
            'account_number' =>  'required|integer',
         ]);
<<<<<<< HEAD
    
         if($validator->fails()){
             return $this->sendError('Error validation', $validator->errors());       
=======

         if($validator->fails()){
             return $this->sendError('Error validation', $validator->errors());
>>>>>>> emmybranch
         }
        $bank = Bank::find($request->bank_id);
        $validate = [
            "bank_id"=>$bank->id,
            "bank_name"=>$bank->bank_name,
            "account_number"=>$request->account_number,
            "account_name"=> "Test name"
        ];
        if($validate){
            return $this->sendResponse($validate , 'Successfully.');
        }
        return $this->sendError('Error validating account number');
    }

    /**
     * member update
     */
    public function updateMember(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
           'photo' =>  'nullable|image|mimes:jpg,png,jpeg,gif',
           'identity_image' =>  'nullable|image|mimes:jpg,png,jpeg,gif|required_with:identity_type_id',
           "identity_type_id" =>"nullable|required_with:identity_image",
           //"identity_type_id" =>"nullable|required_with:identity_image"
           //"identity_type_id" =>"nullable|required_with:identity_image"
        ]);
<<<<<<< HEAD
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
=======

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
>>>>>>> emmybranch
        }

        //$input = $request->all();
        $input = $request->except(['email','bank_id','account_no','account_name','is_bank_verified','is_active','is_deleted','referral_code','cur_bal','prev_bal','user_id','cur_invest_bal','prev_invest_bal','storagex_bank_id','storagex_acct_no']);
       try{
            $model = Member::findOrFail($id)->update($input);
            if ($model) {
                //check and update images
                if ($request->hasFile('photo')) {
                    $imageName = $model->id.'.jpg';
                    $request->photo->storeAs('public/images/members', $imageName);
                    $model->photo = $imageName;
                    $model->save();
                }
                if ($request->hasFile('identity_image')) {
                    $imageName = $model->id.'.jpg';
                    $request->identity_image->storeAs('public/images/identities', $imageName);
                    $model->identity_image = $imageName;
                    $model->save();
                }
                return $this->sendResponse([], 'record updated successfully.');
            } else {
<<<<<<< HEAD
                return $this->sendError('Error updating member'); 
            }
        } catch (Exception $e) {
            return $this->sendError('Error updating record ', $e->getMessage()); 
        }
    }
   
=======
                return $this->sendError('Error updating member');
            }
        } catch (Exception $e) {
            return $this->sendError('Error updating record ', $e->getMessage());
        }
    }

>>>>>>> emmybranch



     /**
     * member update withrawing bank
     */
    public function registerWithdrawalBank(Request $request)
    {
        $validator = Validator::make($request->all(), [
<<<<<<< HEAD
            'member_id' =>  'required|exists:members,id', 
=======
            'member_id' =>  'required|exists:members,id',
>>>>>>> emmybranch
            'bank_id' => 'required|exists:banks,id',
            'account_no' => 'required|max:10|min:10',
            'account_name' => 'required',
            'password' => 'required',
        ]);
<<<<<<< HEAD
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
=======

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
>>>>>>> emmybranch
        }

        $model = Member::find($request['member_id']);
        if(!Member::grantAccess($model, $request['password'])){
<<<<<<< HEAD
            return $this->sendError('Invalid password entered');  
=======
            return $this->sendError('Invalid password entered');
>>>>>>> emmybranch
        }

        //$input = $request->all();
        $success = [];
<<<<<<< HEAD
        
=======

>>>>>>> emmybranch
        $model->bank_id = $request['bank_id'];
        $model->account_no = $request['account_no'];
        $model->account_name = $request['account_name'];
        //validate bank details here
        if(!Util::validateBank($model->bank_id, $model->account_no, $model->account_name )){
<<<<<<< HEAD
            return $this->sendError('Bank detail is invalid');  
=======
            return $this->sendError('Bank detail is invalid');
>>>>>>> emmybranch
        }

        if ($model->save()) {
            $success['bank'] = $model->bank->bank_name;
            $success['account_no'] = $model->account_no;
            $success['account_name'] = $model->account_name;
            return $this->sendResponse($success, 'Bank updated successfully.');
        } else {
<<<<<<< HEAD
            return $this->sendError('Error updating bank'); 
        }
    }

    
=======
            return $this->sendError('Error updating bank');
        }
    }


>>>>>>> emmybranch
     /**
     * member update debit card
     */
    public function registerPaymentDebitCard(Request $request)
    {
        $validator = Validator::make($request->all(), [
<<<<<<< HEAD
            'member_id' =>  'required|exists:members,id', 
=======
            'member_id' =>  'required|exists:members,id',
>>>>>>> emmybranch
            'card_no' => 'required|max:16|min:16',
            'expire' => 'required',
            'cvv' => 'required|min:3|max:3',
            'password' => 'required',
        ]);
<<<<<<< HEAD
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
=======

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
>>>>>>> emmybranch
        }

        $model = Member::find($request['member_id']);
        if(!Member::grantAccess($model, $request['password'])){
<<<<<<< HEAD
            return $this->sendError('Invalid password entered');  
        }
        
        //validate bank details here
        if(!Util::validateDebitcard($model->card_no, $model->expire, $model->cvv )){
            return $this->sendError('Bank detail is invalid');  
=======
            return $this->sendError('Invalid password entered');
        }

        //validate bank details here
        if(!Util::validateDebitcard($model->card_no, $model->expire, $model->cvv )){
            return $this->sendError('Bank detail is invalid');
>>>>>>> emmybranch
        }
        $model = DebitCard::firstOrCreate([
            'member_id'     =>      $request['member_id'],
            'card_no'       =>      $request['card_no'],
            'expire'        =>      $request['expire'],
            'cvv'           =>      $request['cvv'],
            'issuing_bank'  =>      1,
            'card_type'     =>      'Visa',
            ]);

        if ($model) {
            return $this->sendResponse($model, 'Card pdated successfully.');
        } else {
<<<<<<< HEAD
            return $this->sendError('Error updating card'); 
        }
    }

=======
            return $this->sendError('Error updating card');
        }
    }

    /**
     *  show debit card
     */

    public function showDebitCards()
    {
        $model = DebitCard::where('member_id',Auth::user()->member->id)->get();
        return $this->sendResponse($model, 'Debit Cards loaded.');
    }
>>>>>>> emmybranch

    /**
     * show memberbership fee
     */
<<<<<<< HEAD
    public function showMembershipFee($member_id)
    {   
        $membershipfee = MembershipFee::where("member_id",$member_id)->first();
=======
    public function showMembershipFee()
    {
        $membershipfee = MembershipFee::where("member_id",Auth::user()->member->id)->first();
>>>>>>> emmybranch
        if($membershipfee){
            return $this->sendResponse($membershipfee, 'Successfully.');
        }
        return $this->sendError('No Membership record found for this member yet');
    }


    /**
<<<<<<< HEAD
     * create or renew membership fee 
=======
     * create or renew membership fee
>>>>>>> emmybranch
     */
    public function paymembershipFee(Request $request)
    {
        $validator = Validator::make($request->all(), [
<<<<<<< HEAD
            'member_id' =>  'required|exists:members,id', 
            'amount' => 'required',
            'password' => 'required',
        ]);
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }

        $model = Member::find($request['member_id']);
        if(!Member::grantAccess($model, $request['password'])){
            return $this->sendError('Invalid password entered');  
        }
        //check for payment here
        //if(payment()){}
        $membershipfee = MembershipFee::where("member_id",$request->member_id)->first();
=======
            'amount' => 'required',
            'password' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }

        $model = Member::find(Auth::user()->member->id);
        if(!Member::grantAccess($model, $request['password'])){
            return $this->sendError('Invalid password entered');
        }
        //check for payment here
        //if(payment()){}
        $membershipfee = MembershipFee::where("member_id",Auth::user()->member->id)->first();
>>>>>>> emmybranch
        if(!$membershipfee){
            $membershipfee = new MembershipFee;
        }
        $membershipfee->amount = $request->amount;
<<<<<<< HEAD
        $membershipfee->start_date = date('Y-m-d');
        $membershipfee->end_date = $end = date('Y-m-d', strtotime('+1 years'));
        $membershipfee->save();
        
=======
        $membershipfee->member_id = Auth::user()->member->id;
        $membershipfee->start_date = date('Y-m-d');
        $membershipfee->end_date = $end = date('Y-m-d', strtotime('+1 years'));
        $membershipfee->save();
        Member::where('id',Auth::user()->member->id)->update(['has_membership' => '1']);
>>>>>>> emmybranch

        if ($membershipfee->save()) {
            return $this->sendResponse($membershipfee, 'Membership fee paid successfully.');
        } else {
<<<<<<< HEAD
            return $this->sendError('Error paying membership fee '); 
        }
    }

=======
            return $this->sendError('Error paying membership fee ');
        }
    }

    public function transactionHistory(Request $request)
    {

        $res = RegularSavingsTransaction::where('member_id',Auth::user()->member->id)->get();
        return $this->sendResponse($res, '');

    }

    public function disabledWallet(Request $request)
    {
        Member::where('id',Auth::user()->member->id)->update(['disable_wallet_bal' => $request->disable_wallet_bal]);
        return $this->sendResponse([], '');
    }

>>>>>>> emmybranch
}

