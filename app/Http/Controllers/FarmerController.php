<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateFarmerRequest;
use App\Http\Requests\UpdateFarmerRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\Farmer;
use Illuminate\Http\Request;
use Flash;
use Response;

class FarmerController extends AppBaseController
{
    /**
     * Display a listing of the Farmer.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var Farmer $farmers */
        $farmers = Farmer::paginate(10);

        return view('farmers.index')
            ->with('farmers', $farmers);
    }

    /**
     * Show the form for creating a new Farmer.
     *
     * @return Response
     */
    public function create()
    {
        return view('farmers.create');
    }

    /**
     * Store a newly created Farmer in storage.
     *
     * @param CreateFarmerRequest $request
     *
     * @return Response
     */
    public function store(CreateFarmerRequest $request)
    {
        $input = $request->all();

        /** @var Farmer $farmer */
        $farmer = Farmer::create($input);

        if ($request->hasFile('photo')) {
            $imageName = $farmer->id.'.jpg';//.$request->photo->extension();
            $request->photo->storeAs('public/images/farmers', $imageName);
            $farmer->photo = $imageName;
            $farmer->save();
        }

        Flash::success('Farmer saved successfully.');

        return redirect(route('farmers.index'));
    }

    /**
     * Display the specified Farmer.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Farmer $farmer */
        $farmer = Farmer::find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        return view('farmers.show')->with('farmer', $farmer);
    }

    /**
     * Show the form for editing the specified Farmer.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var Farmer $farmer */
        $farmer = Farmer::find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        return view('farmers.edit')->with('farmer', $farmer);
    }

    /**
     * Update the specified Farmer in storage.
     *
     * @param int $id
     * @param UpdateFarmerRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateFarmerRequest $request)
    {
        /** @var Farmer $farmer */
        $farmer = Farmer::find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        $farmer->fill($request->all());

        if ($request->hasFile('photo')) {
            $imageName = $farmer->id.'.jpg';//.$request->photo->extension();
            $request->photo->storeAs('public/images/farmers', $imageName);
            $farmer->photo = $imageName;
           // $farmer->save();
        }
        $farmer->save();

        Flash::success('Farmer updated successfully.');

        return redirect(route('farmers.index'));
    }

    /**
     * Remove the specified Farmer from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Farmer $farmer */
        $farmer = Farmer::find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        $farmer->delete();

        Flash::success('Farmer deleted successfully.');

        return redirect(route('farmers.index'));
    }
}
