<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateInvestmentRequest;
use App\Http\Requests\UpdateInvestmentRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\Investment;
use Illuminate\Http\Request;
use Flash;
use Response;

class InvestmentController extends AppBaseController
{
    /**
     * Display a listing of the Investment.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var Investment $investments */
        $investments = Investment::paginate(10);

        return view('investments.index')
            ->with('investments', $investments);
    }

    /**
     * Show the form for creating a new Investment.
     *
     * @return Response
     */
    public function create()
    {
        return view('investments.create');
    }

    /**
     * Store a newly created Investment in storage.
     *
     * @param CreateInvestmentRequest $request
     *
     * @return Response
     */
    public function store(CreateInvestmentRequest $request)
    {
        $input = $request->all();

        /** @var Investment $investment */
        $investment = Investment::create($input);

        Flash::success('Investment saved successfully.');

        return redirect(route('investments.index'));
    }

    /**
     * Display the specified Investment.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Investment $investment */
        $investment = Investment::find($id);

        if (empty($investment)) {
            Flash::error('Investment not found');

            return redirect(route('investments.index'));
        }

        return view('investments.show')->with('investment', $investment);
    }

    /**
     * Show the form for editing the specified Investment.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var Investment $investment */
        $investment = Investment::find($id);

        if (empty($investment)) {
            Flash::error('Investment not found');

            return redirect(route('investments.index'));
        }

        return view('investments.edit')->with('investment', $investment);
    }

    /**
     * Update the specified Investment in storage.
     *
     * @param int $id
     * @param UpdateInvestmentRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateInvestmentRequest $request)
    {
        /** @var Investment $investment */
        $investment = Investment::find($id);

        if (empty($investment)) {
            Flash::error('Investment not found');

            return redirect(route('investments.index'));
        }

        $investment->fill($request->all());
        $investment->save();

        Flash::success('Investment updated successfully.');

        return redirect(route('investments.index'));
    }

    /**
     * Remove the specified Investment from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Investment $investment */
        $investment = Investment::find($id);

        if (empty($investment)) {
            Flash::error('Investment not found');

            return redirect(route('investments.index'));
        }

        $investment->delete();

        Flash::success('Investment deleted successfully.');

        return redirect(route('investments.index'));
    }
}
