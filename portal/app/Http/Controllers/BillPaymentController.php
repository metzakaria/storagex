<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateBillPaymentRequest;
use App\Http\Requests\UpdateBillPaymentRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\BillPayment;
use Illuminate\Http\Request;
use Flash;
use Response;

class BillPaymentController extends AppBaseController
{
    /**
     * Display a listing of the BillPayment.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var BillPayment $billPayments */
        $billPayments = BillPayment::paginate(10);

        return view('bill_payments.index')
            ->with('billPayments', $billPayments);
    }

    /**
     * Show the form for creating a new BillPayment.
     *
     * @return Response
     */
    public function create()
    {
        return view('bill_payments.create');
    }

    /**
     * Store a newly created BillPayment in storage.
     *
     * @param CreateBillPaymentRequest $request
     *
     * @return Response
     */
    public function store(CreateBillPaymentRequest $request)
    {
        $input = $request->all();

        /** @var BillPayment $billPayment */
        $billPayment = BillPayment::create($input);

        Flash::success('Bill Payment saved successfully.');

        return redirect(route('billPayments.index'));
    }

    /**
     * Display the specified BillPayment.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var BillPayment $billPayment */
        $billPayment = BillPayment::find($id);

        if (empty($billPayment)) {
            Flash::error('Bill Payment not found');

            return redirect(route('billPayments.index'));
        }

        return view('bill_payments.show')->with('billPayment', $billPayment);
    }

    /**
     * Show the form for editing the specified BillPayment.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var BillPayment $billPayment */
        $billPayment = BillPayment::find($id);

        if (empty($billPayment)) {
            Flash::error('Bill Payment not found');

            return redirect(route('billPayments.index'));
        }

        return view('bill_payments.edit')->with('billPayment', $billPayment);
    }

    /**
     * Update the specified BillPayment in storage.
     *
     * @param int $id
     * @param UpdateBillPaymentRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateBillPaymentRequest $request)
    {
        /** @var BillPayment $billPayment */
        $billPayment = BillPayment::find($id);

        if (empty($billPayment)) {
            Flash::error('Bill Payment not found');

            return redirect(route('billPayments.index'));
        }

        $billPayment->fill($request->all());
        $billPayment->save();

        Flash::success('Bill Payment updated successfully.');

        return redirect(route('billPayments.index'));
    }

    /**
     * Remove the specified BillPayment from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var BillPayment $billPayment */
        $billPayment = BillPayment::find($id);

        if (empty($billPayment)) {
            Flash::error('Bill Payment not found');

            return redirect(route('billPayments.index'));
        }

        $billPayment->delete();

        Flash::success('Bill Payment deleted successfully.');

        return redirect(route('billPayments.index'));
    }
}
