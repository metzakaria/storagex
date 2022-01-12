<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\PartnerController;
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\MemberController;

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

/**
 * Partner
 */
Route::post('partner/login', [PartnerController::class, 'login']);
Route::get('partner/getWarehouseReceipts', [PartnerController::class, 'showWarehouseReceipts']);
Route::get('partner/getFarmers', [PartnerController::class, 'showFarmers']);


/**
 * users
 */
Route::post('user/login', [UserController::class, 'login']);
Route::post('user/createMemberUser', [UserController::class, 'createMemberUser']);
Route::post('user/forgotPassword', [UserController::class, 'forgotPassword']);

Route::middleware('auth:sanctum')->group( function () {
   include('api_auth.php');
});

/**
 * handle invalid routs
 */
Route::any('{any}', function(){
    return response()->json(['status'=> false, 'message' => 'Page Not Found.'], 404);
})->where('any', '.*');

Route::resource('banks', App\Http\Controllers\API\BankAPIController::class);