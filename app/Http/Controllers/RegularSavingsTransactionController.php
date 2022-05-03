<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateRegularSavingsTransactionRequest;
use App\Http\Requests\UpdateRegularSavingsTransactionRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\RegularSavingsTransaction;
use Illuminate\Http\Request;
use Flash;
use Response;

class RegularSavingsTransactionController extends AppBaseController
{
    /**
     * Display a listing of the RegularSavingsTransaction.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var RegularSavingsTransaction $regularSavingsTransactions */
        $regularSavingsTransactions = RegularSavingsTransaction::orderBy('id', 'desc')->paginate(10);

        return view('regular_savings_transactions.index')
            ->with('regularSavingsTransactions', $regularSavingsTransactions);
    }

    /**
     * Show the form for creating a new RegularSavingsTransaction.
     *
     * @return Response
     */
    public function create()
    {
        return view('regular_savings_transactions.create');
    }

    /**
     * Store a newly created RegularSavingsTransaction in storage.
     *
     * @param CreateRegularSavingsTransactionRequest $request
     *
     * @return Response
     */
    public function store(CreateRegularSavingsTransactionRequest $request)
    {
        $input = $request->all();

        /** @var RegularSavingsTransaction $regularSavingsTransaction */
        $regularSavingsTransaction = RegularSavingsTransaction::create($input);

        Flash::success('Regular Savings Transaction saved successfully.');

        return redirect(route('regularSavingsTransactions.index'));
    }

    /**
     * Display the specified RegularSavingsTransaction.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var RegularSavingsTransaction $regularSavingsTransaction */
        $regularSavingsTransaction = RegularSavingsTransaction::find($id);

        if (empty($regularSavingsTransaction)) {
            Flash::error('Regular Savings Transaction not found');

            return redirect(route('regularSavingsTransactions.index'));
        }

        return view('regular_savings_transactions.show')->with('regularSavingsTransaction', $regularSavingsTransaction);
    }

    /**
     * Show the form for editing the specified RegularSavingsTransaction.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var RegularSavingsTransaction $regularSavingsTransaction */
        $regularSavingsTransaction = RegularSavingsTransaction::find($id);

        if (empty($regularSavingsTransaction)) {
            Flash::error('Regular Savings Transaction not found');

            return redirect(route('regularSavingsTransactions.index'));
        }

        return view('regular_savings_transactions.edit')->with('regularSavingsTransaction', $regularSavingsTransaction);
    }

    /**
     * Update the specified RegularSavingsTransaction in storage.
     *
     * @param int $id
     * @param UpdateRegularSavingsTransactionRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateRegularSavingsTransactionRequest $request)
    {
        /** @var RegularSavingsTransaction $regularSavingsTransaction */
        $regularSavingsTransaction = RegularSavingsTransaction::find($id);

        if (empty($regularSavingsTransaction)) {
            Flash::error('Regular Savings Transaction not found');

            return redirect(route('regularSavingsTransactions.index'));
        }

        $regularSavingsTransaction->fill($request->all());
        $regularSavingsTransaction->save();

        Flash::success('Regular Savings Transaction updated successfully.');

        return redirect(route('regularSavingsTransactions.index'));
    }

    /**
     * Remove the specified RegularSavingsTransaction from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var RegularSavingsTransaction $regularSavingsTransaction */
        $regularSavingsTransaction = RegularSavingsTransaction::find($id);

        if (empty($regularSavingsTransaction)) {
            Flash::error('Regular Savings Transaction not found');

            return redirect(route('regularSavingsTransactions.index'));
        }

        $regularSavingsTransaction->delete();

        Flash::success('Regular Savings Transaction deleted successfully.');

        return redirect(route('regularSavingsTransactions.index'));
    }
}
