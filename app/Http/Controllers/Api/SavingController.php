<?php

namespace App\Http\Controllers\Api;

<<<<<<< HEAD
=======
use App\Models\TargetSaving;
use App\Models\TargetSavingCat;
>>>>>>> emmybranch
use Illuminate\Support\Facades\Config;
use Validator;
use Illuminate\Http\Request;
use App\Models\SavingType;
use App\Models\RegularSaving;
<<<<<<< HEAD
use App\Models\RegularSavingTransaction;
use App\Models\Member;

=======
use App\Models\RegularSavingsTransaction;
use App\Models\Member;
use App\Models\TargetSavingsTransaction;
use App\Models\DebitCard;
use Illuminate\Support\Facades\Auth;
>>>>>>> emmybranch

class SavingController extends ApiController
{
    /**
     * get saving type
     */
    public function showSavingsType()
<<<<<<< HEAD
    {   
=======
    {
>>>>>>> emmybranch
        $savings_type = SavingType::all();
        return $this->sendResponse($savings_type, 'Successfully.');

    }

    /**
     * get saving frequency
     */
    public function showSavingsFrequencies()
<<<<<<< HEAD
    {   
=======
    {
>>>>>>> emmybranch
        $savings_frequency = Config::get('global.savings_frequency');
        return $this->sendResponse($savings_frequency, 'Successfully.');

    }

    /**
     * get payment method
     */
    public function showPaymentMethod()
<<<<<<< HEAD
    {   
=======
    {
>>>>>>> emmybranch
        $payment_method = Config::get('global.payment_method');
        return $this->sendResponse($payment_method, 'Successfully.');

    }

    /**
<<<<<<< HEAD
     * get savings category 
     */
    public function showSavingsCategories()
    {   
        $savings_category = Config::get('global.savings_category');
=======
     * get savings category
     */
    public function showSavingsCategories()
    {
        $savings_category = TargetSavingCat::all();
>>>>>>> emmybranch
        return $this->sendResponse($savings_category, 'Successfully.');

    }
    /**
     * create regular saving
     */
    public function createRegularSavings(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'member_id' => 'required|unique:regular_savings,member_id|exists:members,id', //only allow one row
            'frequency' => 'required',
            'amount' => 'required',
            'default_payment_method' => 'required',
        ]);
<<<<<<< HEAD
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
        
=======

        if($validator->fails()){
            return $this->sendError($validator->errors()->first(), $validator->errors());
        }

>>>>>>> emmybranch
        $input = $request->all();
        $regular_saving = RegularSaving::create($input);
        if($regular_saving){
            return $this->sendResponse($regular_saving, 'Savings created successfully.');
        }
<<<<<<< HEAD
        return $this->sendError('Error creating regular savings'); 
      
    }

    /**
     * get regular savings transactions 
     */
    public function showRegularSavingsTransactions($member_id)
    {   
        $transactions = RegularSavingTransaction::where("member_id",$member_id)->get();
=======
        return $this->sendError('Error creating regular savings');

    }

    /**
     * get regular savings transactions
     */
    public function showRegularSavingsTransactions()
    {
        $transactions = RegularSavingsTransaction::where("member_id",Auth::user()->member->id)->get();
>>>>>>> emmybranch
        return $this->sendResponse($transactions, 'Successfully.');
    }

    /**
     * fund wallet
     */
    public function fundRegularSavings(Request $request)
    {
        $validator = Validator::make($request->all(), [
<<<<<<< HEAD
            'member_id' => 'required|exists:members,id', 
=======
            'member_id' => 'required|exists:members,id',
>>>>>>> emmybranch
            'password' => 'required',
            'amount' => 'required',
            'pay_method' => 'required',
        ]);
<<<<<<< HEAD
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
        
        $input = $request->all();
        $member = Member::find($input['member_id']);
        if(!Member::grantAccess($member, $input['password'])){
            return $this->sendError('Invalid password or security answer');  
=======

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }

        $input = $request->all();
        $member = Member::find($input['member_id']);
        if(!Member::grantAccess($member, $input['password'])){
            return $this->sendError('Invalid password or security answer');
>>>>>>> emmybranch
        }

        $input["dr_cr"] = "CR";
        $input["description"] = "Wallet Funding from ATM card";
<<<<<<< HEAD
        $regular_saving_fund = RegularSavingTransaction::create($input);
        RegularSavingTransaction::addFundToBalance($regular_saving_fund);
        if($regular_saving_fund){
            return $this->sendResponse($regular_saving_fund, 'Fund added successfully.');
        }
        return $this->sendError('Error adding fund to regular savings'); 
      
=======
        $regular_saving_fund = RegularSavingsTransaction::create($input);
        RegularSavingsTransaction::addFundToBalance($regular_saving_fund);
        if($regular_saving_fund){
            return $this->sendResponse($regular_saving_fund, 'Fund added successfully.');
        }
        return $this->sendError('Error adding fund to regular savings');

>>>>>>> emmybranch
    }

     /**
     * withdraw wallet
     */
    public function DebitRegularSavings(Request $request)
    {
        $validator = Validator::make($request->all(), [
<<<<<<< HEAD
            'member_id' => 'required|exists:members,id', 
=======
            'member_id' => 'required|exists:members,id',
>>>>>>> emmybranch
            'password' => 'required',
            'amount' => 'required',
            'Security_ans' => 'required',
        ]);
<<<<<<< HEAD
   
        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());       
        }
        
        $input = $request->all();
        $member = Member::find($input['member_id']);
        if(!Member::grantAccess($member, $input['password'], $input['Security_ans'])){
            return $this->sendError('Invalid password or security answer');  
        }

        if($member->cur_bal <= $input['amount']){
            return $this->sendError('Insuficient amound in saving account'); 
=======

        if($validator->fails()){
            return $this->sendError($validator->errors()->first(), $validator->errors()->first());
        }

        $input = $request->all();
        $member = Member::find($input['member_id']);
        if(!Member::grantAccess($member, $input['password'], $input['Security_ans'])){
            return $this->sendError('Invalid password or security answer');
        }

        if($member->cur_bal <= $input['amount']){
            return $this->sendError('Insuficient amound in saving account');
>>>>>>> emmybranch
        }

        $input["dr_cr"] = "DR";
        $input["description"] = "Withdrawal from Savings account to bank account";
<<<<<<< HEAD
        $regular_saving_debit = RegularSavingTransaction::create($input);
        RegularSavingTransaction::debitBalance($regular_saving_debit);
        if($regular_saving_debit){
            return $this->sendResponse($regular_saving_debit, 'Debit successful.');
        }
        return $this->sendError('Error adding fund to regular savings'); 
=======
        $regular_saving_debit = RegularSavingsTransaction::create($input);
        RegularSavingsTransaction::debitBalance($regular_saving_debit);
        if($regular_saving_debit){
            return $this->sendResponse($regular_saving_debit, 'Debit successful.');
        }
        return $this->sendError('Error adding fund to regular savings');
    }
    
    public function getTargetSavings(){
        
        $dbR = TargetSaving::orderBy('id', 'desc')->where('member_id',Auth::user()->member->id)->get();
        return $this->sendResponse($dbR, 'Successfully.');
    }
    
    public function getCurrentSavingsAmount(){
        
        $dbR = TargetSaving::where('member_id',Auth::user()->member->id)->where('is_current','1')->first();
        return $this->sendResponse($dbR, 'Successfully.');
    }

    public function createTargetSavings(Request $request)
    {
        $validator = Validator::make($request->all(), [
           // 'member_id' => 'required|unique:regular_savings,member_id|exists:members,id', //only allow one row
            'frequency' => 'required',
            'category_id' => 'required',
            'target_amt' => 'required',
            'name' => 'required',
            'amount_to_save' => 'required',
            'default_payment_method' => 'required',
            'start_date' => 'required',
            'preferred_time' => 'required',
            'end_date' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError( $validator->errors()->first(), $validator->errors());
        }

        $input = $request->all();
        if(!Member::grantAccess(Auth::user()->member, $input['password'],$input['answer'])){
            return $this->sendError('Invalid password or security answer');
        }
        
        $regular_saving = TargetSaving::create(array_merge($input,['member_id'=>Auth::user()->member->id]));
    
        if($regular_saving){
            return $this->sendResponse($regular_saving, 'Savings created successfully.');
        }
        return $this->sendError('Error creating regular savings');

>>>>>>> emmybranch
    }
}
