<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateDebitCardRequest;
use App\Http\Requests\UpdateDebitCardRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\DebitCard;
use Illuminate\Http\Request;
use Flash;
use Response;

class DebitCardController extends AppBaseController
{
    /**
     * Display a listing of the DebitCard.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var DebitCard $debitCards */
        $debitCards = DebitCard::paginate(10);

        return view('debit_cards.index')
            ->with('debitCards', $debitCards);
    }

    /**
     * Show the form for creating a new DebitCard.
     *
     * @return Response
     */
    public function create()
    {
        return view('debit_cards.create');
    }

    /**
     * Store a newly created DebitCard in storage.
     *
     * @param CreateDebitCardRequest $request
     *
     * @return Response
     */
    public function store(CreateDebitCardRequest $request)
    {
        $input = $request->all();

        /** @var DebitCard $debitCard */
        $debitCard = DebitCard::create($input);

        Flash::success('Debit Card saved successfully.');

        return redirect(route('debitCards.index'));
    }

    /**
     * Display the specified DebitCard.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var DebitCard $debitCard */
        $debitCard = DebitCard::find($id);

        if (empty($debitCard)) {
            Flash::error('Debit Card not found');

            return redirect(route('debitCards.index'));
        }

        return view('debit_cards.show')->with('debitCard', $debitCard);
    }

    /**
     * Show the form for editing the specified DebitCard.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var DebitCard $debitCard */
        $debitCard = DebitCard::find($id);

        if (empty($debitCard)) {
            Flash::error('Debit Card not found');

            return redirect(route('debitCards.index'));
        }

        return view('debit_cards.edit')->with('debitCard', $debitCard);
    }

    /**
     * Update the specified DebitCard in storage.
     *
     * @param int $id
     * @param UpdateDebitCardRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateDebitCardRequest $request)
    {
        /** @var DebitCard $debitCard */
        $debitCard = DebitCard::find($id);

        if (empty($debitCard)) {
            Flash::error('Debit Card not found');

            return redirect(route('debitCards.index'));
        }

        $debitCard->fill($request->all());
        $debitCard->save();

        Flash::success('Debit Card updated successfully.');

        return redirect(route('debitCards.index'));
    }

    /**
     * Remove the specified DebitCard from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var DebitCard $debitCard */
        $debitCard = DebitCard::find($id);

        if (empty($debitCard)) {
            Flash::error('Debit Card not found');

            return redirect(route('debitCards.index'));
        }

        $debitCard->delete();

        Flash::success('Debit Card deleted successfully.');

        return redirect(route('debitCards.index'));
    }
}
