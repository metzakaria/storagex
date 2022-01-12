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


class BillsController extends ApiController
{
    /**
     * Display a listing of the resource.
     *
     *
     */
    public function buyAirtime(Request $request)
    {

        $model = Member::find($request->member_id);
        if(!Member::grantAccess($model, $request['password'])){
            return $this->sendError('Invalid password entered');
        }

        if ($request->amount > Auth::user()->member->cur_bal) {

            return $this->sendError("You have low credit point, please top up your account");

        } else {

            $data = array(
                'serviceID' => $request->serviceID,
                'amount' => $request->amount,
                'phone' => $request->recepient,
                'request_id' => rand(1000, 9000),
            );
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => env('VTPASS_HOST'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_USERPWD => env('VTPASS_USERNAME').":".env('VTPASS_PASSWORD'),
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => $data,
            ));
            $response = curl_exec($curl);
            $err = curl_error($curl);
            $transaction = json_decode($response, true);
            if ($transaction['code'] !== "000") {

                return $this->sendError("Opps,Error sending your request, try again later");
            } else {

                BillPayment::create([
                    'member_id' => Auth::user()->member->id,
                    'bill_type' => 'airtime',
                    'amount' => $request->amount,
                    'receiver_account' => $request->recepient,
                    'description' =>  $transaction['content']['transactions']["type"],
                    'is_paid' => '1',
                    'transaction_id' => $transaction['content']['transactions']["transactionId"],
                ]);
                return $this->sendResponse([],'Transaction successful.');

            }
        }

    }

    /**
     * Show the form for creating a new resource.
     *
     *
     */
    public function buyData(Request $request)
    {

        $model = Member::find($request->member_id);
        if(!Member::grantAccess($model, $request['password'])){
            return $this->sendError('Invalid password entered');
        }

        if ($request->amount > Auth::user()->member->cur_bal) {

            return $this->sendError("You have low credit point, please top up your account");

        } else {

            $data = array(
                'serviceID' => $request->serviceID,
                'amount' => $request->amount,
                'variation_code' => $request->variation_code,
                'billersCode' => $request->billersCode,
                'request_id' => rand(1000, 9000),
                'phone' => $request->phone,
            );
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => env('VTPASS_HOST'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_USERPWD => env('VTPASS_USERNAME') . ":" . env('VTPASS_PASSWORD'),
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => $data,
            ));
            $response = curl_exec($curl);
            $err = curl_error($curl);

            $transaction = json_decode($response, true);
            if ($transaction['code'] !== "000") {

                return $this->sendError("Opps,Error sending your request, try again later");
            } else {

                BillPayment::create([
                    'member_id' => Auth::user()->member->id,
                    'bill_type' => 'data',
                    'amount' => $request->amount,
                    'receiver_account' => $request->recepient,
                    'description' =>  $transaction['content']['transactions']["type"],
                    'is_paid' => '1',
                    'transaction_id' => $transaction['content']['transactions']["transactionId"],
                ]);

                return $this->sendResponse([],'Transaction successful.');

            }
        }

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function buyUtilities(Request $request)
    {

        $model = Member::find($request->member_id);
        if(!Member::grantAccess($model, $request['password'])){
            return $this->sendError('Invalid password entered');
        }

        if ($request->amount > Auth::user()->member->cur_bal) {

            return $this->sendError("You have low credit point, please top up your account");

        } else {

            $data = array(
                'serviceID' => $request->serviceID,
                'amount' => $request->amount,
                'variation_code' => $request->variation_code,
                'billersCode' => $request->billersCode,
                'request_id' => rand(1000, 9000),
                'phone' => $request->phone,
                "subscription_type" => $request->subscription_type,
                "quantity"=> $request->quantity
            );
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => env('VTPASS_HOST'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_USERPWD => env('VTPASS_USERNAME') . ":" . env('VTPASS_PASSWORD'),
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => $data,
            ));
            $response = curl_exec($curl);
            $err = curl_error($curl);

            echo $response;
            $transaction = json_decode($response, true);
            if ($transaction['code'] !== "000") {

                return $this->sendError("Opps,Error sending your request, try again later");
            } else {

                BillPayment::create([
                    'member_id' => Auth::user()->member->id,
                    'bill_type' => 'tv',
                    'amount' => $request->amount,
                    'receiver_account' => $request->recepient,
                    'description' =>  $transaction['content']['transactions']["type"],
                    'is_paid' => '1',
                    'transaction_id' => $transaction['content']['transactions']["transactionId"],
                ]);

                return $this->sendResponse([],'Transaction successful.');

            }
        }

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function buyTvSubscription(Request $request)
    {

        $model = Member::find($request->member_id);
        if(!Member::grantAccess($model, $request['password'])){
            return $this->sendError('Invalid password entered');
        }

        if ($request->amount > Auth::user()->member->cur_bal) {

            return $this->sendError("You have low credit point, please top up your account");

        } else {

            $data = array(
                'amount' => $request->amount,
                'variation_code' => $request->variation_code,
                'billersCode' => $request->billersCode,
                'serviceID' => $request->serviceID,
                'request_id' => rand(1000, 9000),
                'phone' =>  $request->phone,
            );
            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL => env('VTPASS_HOST'),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_USERPWD => env('VTPASS_USERNAME') . ":" . env('VTPASS_PASSWORD'),
                CURLOPT_TIMEOUT => 30,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "POST",
                CURLOPT_POSTFIELDS => $data,
            ));
            $response = curl_exec($curl);
            $err = curl_error($curl);

            echo $response;
            $transaction = json_decode($response, true);
            if ($transaction['code'] !== "000") {

                return $this->sendError("Opps,Error sending your request, try again later");
            } else {

                BillPayment::create([
                    'member_id' => Auth::user()->member->id,
                    'bill_type' => 'electricity',
                    'amount' => $request->amount,
                    'receiver_account' => $request->recepient,
                    'description' =>  $transaction['content']['transactions']["type"],
                    'is_paid' => '1',
                    'transaction_id' => $transaction['content']['transactions']["transactionId"],
                ]);

                return $this->sendResponse([],'Transaction successful.');

            }
        }

    }
}
