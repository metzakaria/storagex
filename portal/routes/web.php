<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Auth::routes();


Route::get('/validateStorage/{id}', [
    App\Http\Controllers\FarmerStorageController::class, 'validateStorage'
])->name('validateStorage');

Route::middleware(['auth'])->group(function () { 

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', [
    HomeController::class, 'index'
])->name('home');


Route::resource('farmers', App\Http\Controllers\FarmerController::class);

Route::resource('billPayments', App\Http\Controllers\BillPaymentController::class);

Route::resource('commodities', App\Http\Controllers\CommodityController::class);

Route::resource('debitCards', App\Http\Controllers\DebitCardController::class);

Route::resource('farmerStorages', App\Http\Controllers\FarmerStorageController::class);

Route::resource('groupMembers', App\Http\Controllers\GroupMemberController::class);

Route::resource('groupMsgReplies', App\Http\Controllers\GroupMsgReplyController::class);

Route::resource('groupMsgs', App\Http\Controllers\GroupMsgController::class);

Route::resource('groups', App\Http\Controllers\GroupController::class);

Route::resource('investmentAuctions', App\Http\Controllers\InvestmentAuctionController::class);

Route::resource('investmentProducts', App\Http\Controllers\InvestmentProductController::class);

Route::resource('investments', App\Http\Controllers\InvestmentController::class);

Route::resource('members', App\Http\Controllers\MemberController::class);

Route::resource('membershipFees', App\Http\Controllers\MembershipFeeController::class);

Route::resource('partners', App\Http\Controllers\PartnerController::class);

Route::resource('referrals', App\Http\Controllers\ReferralController::class);

Route::resource('regularSavings', App\Http\Controllers\RegularSavingController::class);

Route::resource('regularSavingsTransactions', App\Http\Controllers\RegularSavingsTransactionController::class);

Route::resource('targetSavings', App\Http\Controllers\TargetSavingController::class);

Route::resource('warehouses', App\Http\Controllers\WarehouseController::class);

Route::resource('users', App\Http\Controllers\UsersController::class);

Route::resource('targetSavings', App\Http\Controllers\TargetSavingController::class);

Route::resource('regularSavingsTransactions', App\Http\Controllers\RegularSavingsTransactionController::class);

Route::resource('regularSavings', App\Http\Controllers\RegularSavingController::class);

Route::resource('investmentProducts', App\Http\Controllers\InvestmentProductController::class);

Route::resource('investmentAuctions', App\Http\Controllers\InvestmentAuctionController::class);

Route::resource('groupMsgs', App\Http\Controllers\GroupMsgController::class);

Route::resource('groupMsgReplies', App\Http\Controllers\GroupMsgReplyController::class);

Route::resource('groupMembers', App\Http\Controllers\GroupMemberController::class);

Route::resource('farmerStorages', App\Http\Controllers\FarmerStorageController::class);

Route::resource('debitCards', App\Http\Controllers\DebitCardController::class);

Route::resource('billPayments', App\Http\Controllers\BillPaymentController::class);

Route::get('/generate', function (){
    \Illuminate\Support\Facades\Artisan::call('storage:link');
    echo 'ok';
});



});