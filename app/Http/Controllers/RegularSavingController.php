<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateRegularSavingRequest;
use App\Http\Requests\UpdateRegularSavingRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\RegularSaving;
use Illuminate\Http\Request;
use Flash;
use Response;

class RegularSavingController extends AppBaseController
{
    /**
     * Display a listing of the RegularSaving.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var RegularSaving $regularSavings */
        $regularSavings = RegularSaving::paginate(10);

        return view('regular_savings.index')
            ->with('regularSavings', $regularSavings);
    }

    /**
     * Show the form for creating a new RegularSaving.
     *
     * @return Response
     */
    public function create()
    {
        return view('regular_savings.create');
    }

    /**
     * Store a newly created RegularSaving in storage.
     *
     * @param CreateRegularSavingRequest $request
     *
     * @return Response
     */
    public function store(CreateRegularSavingRequest $request)
    {
        $input = $request->all();

        /** @var RegularSaving $regularSaving */
        $regularSaving = RegularSaving::create($input);

        Flash::success('Regular Saving saved successfully.');

        return redirect(route('regularSavings.index'));
    }

    /**
     * Display the specified RegularSaving.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var RegularSaving $regularSaving */
        $regularSaving = RegularSaving::find($id);

        if (empty($regularSaving)) {
            Flash::error('Regular Saving not found');

            return redirect(route('regularSavings.index'));
        }

        return view('regular_savings.show')->with('regularSaving', $regularSaving);
    }

    /**
     * Show the form for editing the specified RegularSaving.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var RegularSaving $regularSaving */
        $regularSaving = RegularSaving::find($id);

        if (empty($regularSaving)) {
            Flash::error('Regular Saving not found');

            return redirect(route('regularSavings.index'));
        }

        return view('regular_savings.edit')->with('regularSaving', $regularSaving);
    }

    /**
     * Update the specified RegularSaving in storage.
     *
     * @param int $id
     * @param UpdateRegularSavingRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateRegularSavingRequest $request)
    {
        /** @var RegularSaving $regularSaving */
        $regularSaving = RegularSaving::find($id);

        if (empty($regularSaving)) {
            Flash::error('Regular Saving not found');

            return redirect(route('regularSavings.index'));
        }

        $regularSaving->fill($request->all());
        $regularSaving->save();

        Flash::success('Regular Saving updated successfully.');

        return redirect(route('regularSavings.index'));
    }

    /**
     * Remove the specified RegularSaving from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var RegularSaving $regularSaving */
        $regularSaving = RegularSaving::find($id);

        if (empty($regularSaving)) {
            Flash::error('Regular Saving not found');

            return redirect(route('regularSavings.index'));
        }

        $regularSaving->delete();

        Flash::success('Regular Saving deleted successfully.');

        return redirect(route('regularSavings.index'));
    }
}
