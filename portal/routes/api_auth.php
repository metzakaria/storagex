<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\MemberController;
use App\Http\Controllers\Api\SavingController;
use App\Http\Controllers\Api\InvestmentController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



///user routes
Route::post('user/changePassword', [UserController::class, 'changePassword']);
Route::get('user/getuserById/{id}', [UserController::class, 'show']);

///member routes
Route::get('member/getMemberById/{id}', [MemberController::class, 'showById']);
Route::get('member/getMemberByUserId/{user_id}', [MemberController::class, 'showByUserId']);
Route::post('member/updateMember/{id}', [MemberController::class, 'updateMember']);
Route::post('member/validateBankAccount', [MemberController::class, 'validateBankAccount']);
Route::post('member/registerWithdrawalBank', [MemberController::class, 'registerWithdrawalBank']);
Route::post('member/registerPaymentDebitCard', [MemberController::class, 'registerPaymentDebitCard']);
Route::post('member/paymembershipFee', [MemberController::class, 'paymembershipFee']);
Route::get('member/getMembershipFee/{id}', [MemberController::class, 'showMembershipFee']);


///savings routes
Route::get('saving/getSavingType', [SavingController::class, 'showSavingsType']);
Route::post('saving/creatRegularSaving', [SavingController::class, 'createRegularSavings']);
Route::get('saving/getSavingFrequencies', [SavingController::class, 'showSavingsFrequencies']);
Route::get('saving/getPaymentMethod', [SavingController::class, 'showPaymentMethod']);
Route::get('saving/getSavingCategories', [SavingController::class, 'showSavingsCategories']);
Route::get('saving/getRegularSavingTransactions/member_id/{member_id}', [SavingController::class, 'showRegularSavingsTransactions']);
Route::post('saving/fundRegularSavings', [SavingController::class, 'fundRegularSavings']);
Route::post('saving/debitRegularSavings', [SavingController::class, 'DebitRegularSavings']);


///Investment routes
Route::get('investment/getInvestmentProducts', [InvestmentController::class, 'showInvestmentProducts']);
Route::get('investment/getMyInvestments', [InvestmentController::class, 'showMyInvestments']);
Route::post('investment/buyInvestment', [InvestmentController::class, 'buyInvestmentProduct']);
Route::post('investment/checkInvestmentSummary', [InvestmentController::class, 'showInvestmentSummary']);
Route::post('investment/auctionMyInvestment', [InvestmentController::class, 'auctionMyInvestment']);
Route::get('investment/getAuctionByInvestmentProduct/{investment_product_id}', [InvestmentController::class, 'showAuctionByInvestmentProduct']);
Route::post('investment/buyAuctionInvestment', [InvestmentController::class, 'buyAuctionInvestment']);
Route::post('investment/transferInvestmentBalToSavingsBal', [InvestmentController::class, 'moveInvestmentBalToSavingsBal']);

