<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\MemberController;
use App\Http\Controllers\Api\SavingController;
use App\Http\Controllers\Api\InvestmentController;
use App\Http\Controllers\Api\StockController;
use App\Http\Controllers\Api\BillsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
| add.
*/


///user routes
Route::post('user/changePassword', [UserController::class, 'changePassword']);
Route::get('user/getuserById/{id}', [UserController::class, 'show']);

///member routes
Route::get('member/getMemberById', [MemberController::class, 'showById']);
Route::get('member/getMemberByUserId/{user_id}', [MemberController::class, 'showByUserId']);
Route::post('member/updateMember/{id}', [MemberController::class, 'updateMember']);
Route::post('member/validateBankAccount', [MemberController::class, 'validateBankAccount']);
Route::post('member/registerWithdrawalBank', [MemberController::class, 'registerWithdrawalBank']);
Route::post('member/registerPaymentDebitCard', [MemberController::class, 'registerPaymentDebitCard']);
Route::post('member/paymembershipFee', [MemberController::class, 'paymembershipFee']);
Route::get('member/getMembershipFee', [MemberController::class, 'showMembershipFee']);
Route::get('member/getDebitCards', [MemberController::class, 'showDebitCards']);
Route::get('transaction/transactionHistory', [MemberController::class, 'transactionHistory']);
Route::post('member/disabledWallet', [MemberController::class, 'disabledWallet']);


///savings routes
Route::get('saving/getSavingType', [SavingController::class, 'showSavingsType']);
Route::post('saving/creatRegularSaving', [SavingController::class, 'createRegularSavings']);
Route::get('saving/getSavingFrequencies', [SavingController::class, 'showSavingsFrequencies']);
Route::get('saving/getPaymentMethod', [SavingController::class, 'showPaymentMethod']);
Route::get('saving/getSavingCategories', [SavingController::class, 'showSavingsCategories']);
Route::get('saving/getRegularSavingTransactions', [SavingController::class, 'showRegularSavingsTransactions']);
Route::post('saving/fundRegularSavings', [SavingController::class, 'fundRegularSavings']);
Route::post('saving/debitRegularSavings', [SavingController::class, 'DebitRegularSavings']);


Route::post('saving/createTargetSavings', [SavingController::class, 'createTargetSavings']);
Route::get('saving/getTargetSavings', [SavingController::class, 'getTargetSavings']);
Route::get('saving/getTAmount', [SavingController::class, 'getCurrentSavingsAmount']);


///Investment routes
Route::get('investment/getInvestmentProducts', [InvestmentController::class, 'showInvestmentProducts']);
Route::get('investment/getMyInvestments', [InvestmentController::class, 'showMyInvestments']);
Route::post('investment/buyInvestment', [InvestmentController::class, 'buyInvestmentProduct']);
Route::post('investment/checkInvestmentSummary', [InvestmentController::class, 'showInvestmentSummary']);
Route::post('investment/auctionMyInvestment', [InvestmentController::class, 'auctionMyInvestment']);
Route::get('investment/getAuctionByInvestmentProduct/{investment_product_id}', [InvestmentController::class, 'showAuctionByInvestmentProduct']);
Route::post('investment/buyAuctionInvestment', [InvestmentController::class, 'buyAuctionInvestment']);
Route::post('investment/transferInvestmentBalToSavingsBal', [InvestmentController::class, 'moveInvestmentBalToSavingsBal']);


//Stock
Route::get('stock/getStockList', [StockController::class, 'indexListStockItems']);
Route::post('stock/saveMemberInterest', [StockController::class, 'billsstoreMemberInterest']);
Route::get('stock/show_interest', [StockController::class, 'showInterest']);
Route::post('stock/removeMemberInterest', [StockController::class, 'removeMemberInterest']);
Route::post('stock/addStock', [StockController::class, 'stockUpPurchase']);
Route::get('stock/showCart', [StockController::class, 'showCart']);
Route::post('stock/deleteCart', [StockController::class, 'deleteCart']);
Route::post('stock/storeCart', [StockController::class, 'storeCart']);

Route::get('bills/getAirtimeNetwork', [BillsController::class, 'getAirtimeNetwork']);
Route::get('bills/getVariation', [BillsController::class, 'getVariation']);
Route::post('bills/verifySmartCard', [BillsController::class, 'verifySmartCard']);
Route::post('bills/buyService', [BillsController::class, 'buyService']);
Route::get('bills/getBillsNetwork', [BillsController::class, 'getBillsNetwork']);

