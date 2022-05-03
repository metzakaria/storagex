<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateTargetSavingRequest;
use App\Http\Requests\UpdateTargetSavingRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\TargetSaving;
use Illuminate\Http\Request;
use Flash;
use Response;

class TargetSavingController extends AppBaseController
{
    /**
     * Display a listing of the TargetSaving.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var TargetSaving $targetSavings */
        $targetSavings = TargetSaving::paginate(10);

        return view('target_savings.index')
            ->with('targetSavings', $targetSavings);
    }

    /**
     * Show the form for creating a new TargetSaving.
     *
     * @return Response
     */
    public function create()
    {
        return view('target_savings.create');
    }

    /**
     * Store a newly created TargetSaving in storage.
     *
     * @param CreateTargetSavingRequest $request
     *
     * @return Response
     */
    public function store(CreateTargetSavingRequest $request)
    {
        $input = $request->all();

        /** @var TargetSaving $targetSaving */
        $targetSaving = TargetSaving::create($input);

        Flash::success('Target Saving saved successfully.');

        return redirect(route('targetSavings.index'));
    }

    /**
     * Display the specified TargetSaving.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var TargetSaving $targetSaving */
        $targetSaving = TargetSaving::find($id);

        if (empty($targetSaving)) {
            Flash::error('Target Saving not found');

            return redirect(route('targetSavings.index'));
        }

        return view('target_savings.show')->with('targetSaving', $targetSaving);
    }

    /**
     * Show the form for editing the specified TargetSaving.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var TargetSaving $targetSaving */
        $targetSaving = TargetSaving::find($id);

        if (empty($targetSaving)) {
            Flash::error('Target Saving not found');

            return redirect(route('targetSavings.index'));
        }

        return view('target_savings.edit')->with('targetSaving', $targetSaving);
    }

    /**
     * Update the specified TargetSaving in storage.
     *
     * @param int $id
     * @param UpdateTargetSavingRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateTargetSavingRequest $request)
    {
        /** @var TargetSaving $targetSaving */
        $targetSaving = TargetSaving::find($id);

        if (empty($targetSaving)) {
            Flash::error('Target Saving not found');

            return redirect(route('targetSavings.index'));
        }

        $targetSaving->fill($request->all());
        $targetSaving->save();

        Flash::success('Target Saving updated successfully.');

        return redirect(route('targetSavings.index'));
    }

    /**
     * Remove the specified TargetSaving from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var TargetSaving $targetSaving */
        $targetSaving = TargetSaving::find($id);

        if (empty($targetSaving)) {
            Flash::error('Target Saving not found');

            return redirect(route('targetSavings.index'));
        }

        $targetSaving->delete();

        Flash::success('Target Saving deleted successfully.');

        return redirect(route('targetSavings.index'));
    }
}
