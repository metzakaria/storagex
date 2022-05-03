<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateFarmerStorageRequest;
use App\Http\Requests\UpdateFarmerStorageRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\FarmerStorage;
use Illuminate\Http\Request;
use Flash;
use Response;

class FarmerStorageController extends AppBaseController
{
    /**
     * Display a listing of the FarmerStorage.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var FarmerStorage $farmerStorages */
        $farmerStorages = FarmerStorage::paginate(10);

        return view('farmer_storages.index')
            ->with('farmerStorages', $farmerStorages);
    }

    /**
     * Show the form for creating a new FarmerStorage.
     *
     * @return Response
     */
    public function validateStorage($id)
    {   
        /** @var FarmerStorage $farmerStorage */
        $farmerStorage = FarmerStorage::find($id);

        if (empty($farmerStorage)) {
            Flash::error('Farmer Storage not found');
        }

        return view('farmer_storages.show_qrcode')->with('farmerStorage', $farmerStorage);
    }

    /**
     * Show the form for creating a new FarmerStorage.
     *
     * @return Response
     */
    public function create()
    {
        return view('farmer_storages.create');
    }
    /**
     * Store a newly created FarmerStorage in storage.
     *
     * @param CreateFarmerStorageRequest $request
     *
     * @return Response
     */
    public function store(CreateFarmerStorageRequest $request)
    {
        $input = $request->all();

        /** @var FarmerStorage $farmerStorage */
        $farmerStorage = FarmerStorage::create($input);

        Flash::success('Farmer Storage saved successfully.');

        return redirect(route('farmerStorages.index'));
    }

    /**
     * Display the specified FarmerStorage.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var FarmerStorage $farmerStorage */
        $farmerStorage = FarmerStorage::find($id);

        if (empty($farmerStorage)) {
            Flash::error('Farmer Storage not found');

            return redirect(route('farmerStorages.index'));
        }

        return view('farmer_storages.show')->with('farmerStorage', $farmerStorage);
    }

    /**
     * Show the form for editing the specified FarmerStorage.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var FarmerStorage $farmerStorage */
        $farmerStorage = FarmerStorage::find($id);

        if (empty($farmerStorage)) {
            Flash::error('Farmer Storage not found');

            return redirect(route('farmerStorages.index'));
        }

        return view('farmer_storages.edit')->with('farmerStorage', $farmerStorage);
    }

    /**
     * Update the specified FarmerStorage in storage.
     *
     * @param int $id
     * @param UpdateFarmerStorageRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateFarmerStorageRequest $request)
    {
        /** @var FarmerStorage $farmerStorage */
        $farmerStorage = FarmerStorage::find($id);

        if (empty($farmerStorage)) {
            Flash::error('Farmer Storage not found');

            return redirect(route('farmerStorages.index'));
        }

        $farmerStorage->fill($request->all());
        $farmerStorage->save();

        Flash::success('Farmer Storage updated successfully.');

        return redirect(route('farmerStorages.index'));
    }

    /**
     * Remove the specified FarmerStorage from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var FarmerStorage $farmerStorage */
        $farmerStorage = FarmerStorage::find($id);

        if (empty($farmerStorage)) {
            Flash::error('Farmer Storage not found');

            return redirect(route('farmerStorages.index'));
        }

        $farmerStorage->delete();

        Flash::success('Farmer Storage deleted successfully.');

        return redirect(route('farmerStorages.index'));
    }
}
