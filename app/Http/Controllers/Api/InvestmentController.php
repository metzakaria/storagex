<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Api\ApiController;
use App\Models\BillPayment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Models\Member;
use App\Models\InvestmentProduct;
use App\Models\Investment;
use App\Models\InvestmentAuction;
use App\Models\RegularSavingTransaction;
use App\Models\Util;
Use \Carbon\Carbon;
use Illuminate\Support\Facades\DB;


class InvestmentController extends ApiController
{
    

    /**
     * get list of investment products
     */
    public function showInvestmentProducts(Request $request)
    {
        $investmentProducts = InvestmentProduct::latest();
        if($request["name"]){
            $investmentProducts->where('name','LIKE','%'.$request["name"].'%');
        }
        if($request["is_active"]){
            $investmentProducts->where('is_active',$request["is_active"]);
        }
        if($request["is_matured"]){
            $investmentProducts->where('is_matured',$request["is_matured"]);
        }
        if($request["investment_id"]){
            $investmentProducts->where('id',$request["investment_id"]);
        }
        $investmentProducts = $investmentProducts->get();
       return $this->sendResponse($investmentProducts, 'Successfully.');
    }


    /**
     * get list of my investment
     */
    public function showMyInvestments(Request $request)
    {
        $investment = Investment::where('member_id',Auth::user()->member->id)->latest();
        if($request["name"]){
            //$investment->where('name','LIKE','%'.$request["name"].'%');
        }
        $investment = $investment->get();
       return $this->sendResponse($investment, 'Successfully.');
    }


    /**
    * get summary of new investment
    */
    public function showInvestmentSummary(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'invest_product_id' => 'required|exists:investment_products,id',
            'buying_units' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }

        $investment_product = InvestmentProduct::find($request['invest_product_id']);
        $response = [
            'start_date'        =>    $investment_product->start_date,
            'mature_date'       =>    $investment_product->mature_date,
            'buying_units'      =>    $request['buying_units'],
            'buying_amount'     =>    ($request['buying_units']*$investment_product->unit_amount),
            'buying_date'       =>    date('Y-m-d'),
            'buying_return'     =>    round($request['buying_units']*$investment_product->unit_roi(true)),
            'buying_interest'   =>    round($investment_product->interest_now()),
        ];
       return $this->sendResponse($response, 'Successfully.');
    }


    /**
    * auction my investment
    */
    public function auctionMyInvestment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'investment_id' => 'required|exists:investments,id',
            'qty_offer' => 'required',
            'unit_amount' => 'required',
            'offer_close_at' => 'required',
            'password' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError($validator->errors()->first(), $validator->errors());
        }

        $input = $request->all();
        $data =  Carbon::parse($input['offer_close_at'])->format('Y-m-d h:i:s');
        if(!Util::validateDate($data,'Y-m-d H:i:s')){
            return $this->sendError('Invalid offer close date format.. allow fomat is Y-m-d h:i:s');
        }

        $investment = Investment::find($input['investment_id']);
        //validate member cridential
        if(!Member::grantAccess($investment->member, $input['password'])){
            return $this->sendError('Invalid password entered');
        }

        $input['invest_product_id'] = $investment->invest_product_id;
        $input['total_amount']      = $input['qty_offer'] * $input['unit_amount'];
        $auctioned = InvestmentAuction::create($input);
        if($auctioned){
            return $this->sendResponse($auctioned, 'Auctioned  successfully.');
        }
        return $this->sendError('Error auctioning my investment');
    }

    /**
     * buy investment
     */
    public function buyInvestmentProduct(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'invest_product_id' => 'required|exists:investment_products,id',
            'member_id' => 'required|exists:members,id',
            'password' => 'required',
            'qty_bought' => 'required',
            'amt_bought' => 'required',
            'pay_method' => 'required',
            't_n_c' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }
        if($request['t_n_c']!='1'){
            return $this->sendError('You must accept the terms and condition of this investment');
        }

        $input = $request->all();
        $member = Member::find($input['member_id']);
        if(!Member::grantAccess($member, $input['password'])){
            return $this->sendError('Invalid password entered');
        }

        $investment = Investment::create($input);
        if($investment){
            return $this->sendResponse($investment, 'Investment created successfully.');
        }
        return $this->sendError('Error adding adding investment');
    }



    /**
     * get list of auction investment
     */
    public function showAuctionByInvestmentProduct($investment_product_id)
    {
       $auction_investment = InvestmentAuction::where('invest_product_id',$investment_product_id)->get();
       return $this->sendResponse($auction_investment, 'Successfully.');
    }

    /**
     * buy auction investment
     */
    public function buyAuctionInvestment(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'investment_auction_id' => 'required|exists:investment_auctions,id',
            'boughtby_member' => 'required|exists:members,id',
            'password' => 'required',
            'total_amount' => 'required',
            'pay_method' => 'required',
            't_n_c' => 'required',
        ]);

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }
        if($request['t_n_c']!='1'){
            return $this->sendError('You must accept the terms and condition of this investment');
        }

        $input = $request->all();
        $member = Member::find($input['boughtby_member']);
        if(!Member::grantAccess($member, $input['password'])){
            return $this->sendError('Invalid password entered');
        }


        if(!$member->debitWallet($input['total_amount'])){
            return $this->sendError('Error charging your account');
        }

        $success = [];
        try{
            DB::transaction(function() use ($input,&$success)  {
                $investment_auction = InvestmentAuction::find($input['investment_auction_id']);
                $investment_auction->is_sold = 1;
                $investment_auction->date_sold = Carbon::now();
                $investment_auction->boughtby_member = $input['boughtby_member'];
                $investment_auction->save();

                //create entry in investment table
                $investment = Investment::create([
                    'invest_product_id'         =>      $investment_auction->invest_product_id,
                    'member_id'                 =>      $input['boughtby_member'],
                    'qty_bought'                =>      $investment_auction->qty_offer,
                    'amt_bought'                =>      $investment_auction->total_amount,
                    'expect_amt_return'         =>      ($investment_auction->qty_offer*$investment_auction->investment_product->unit_roi(true,$investment_auction->total_amount)),
                    'is_auctioned'              =>      1,
                    'auction_id'                =>      $investment_auction->id,
                    't_n_c'                     =>      $input['t_n_c'],
                    'payment_method'            =>      $input['pay_method'],
                ]);
                $success =  $investment;
            });

             return $this->sendResponse($success, 'Investment bought successfully.');

        } catch (Exception $e) {
            return $this->sendError('Error buying auctioned investment', $e->getMessage());
        }

    }

    /**
     * investment withdrawal
     */
    public function moveInvestmentBalToSavingsBal(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'investment_id' => 'required|exists:investments,id',
            'password' => 'required',
            'security_ans' =>'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Error validation', $validator->errors());
        }

        $input = $request->all();
        $member = Member::find($input['member_id']);
        if(!Member::grantAccess($member, $input['password'], $input['security_ans'])){
            return $this->sendError('Invalid password or security answer entered');
        }


        $success = [];
        try{
            DB::transaction(function() use ($input,$member, &$success)  {
                $success['status'] =  false;
                $investment = Investment::find($input['investment_id']);
                if($member->cur_invest_bal > 0 ){
                    $cur_invest_bal = $member->cur_invest_bal;
                    //create entry for savings
                    $savings = RegularSavingTransaction::create([
                        'description'         =>      "fransfer from investment to savings",
                        'member_id'           =>      $member->id,
                        'amount'              =>      $cur_invest_bal,
                        'dr_cr'               =>      'CR',
                        'bal_affected'        =>      1,
                        'pay_method'          =>      'local',
                    ]);

                    //add fund to member bal
                    $cur_bal = $member->cur_bal;
                    $member->cur_bal =  $cur_bal + $cur_invest_bal;
                    $member->prev_bal = $cur_bal;
                    $member->cur_invest_bal = '0';
                    $member->prev_invest_bal = $cur_invest_bal;
                    $member->save();
                    $success['status'] =  true;
                }
                //$member->makeHidden('user');
                $success['data'] =  $member;
            });

            if($success['status'] ==  true){
                return $this->sendResponse($success['data'], 'Investment bought successfully.');
            }
            return $this->sendError('Error withdrawing investment');


        } catch (Exception $e) {
            return $this->sendError('Error buying auctioned investment', $e->getMessage());
        }

    }

}
