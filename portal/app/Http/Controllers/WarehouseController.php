<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateWarehouseRequest;
use App\Http\Requests\UpdateWarehouseRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\Warehouse;
use Illuminate\Http\Request;
use Flash;
use Response;

class WarehouseController extends AppBaseController
{
    /**
     * Display a listing of the Warehouse.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var Warehouse $warehouses */
        $warehouses = Warehouse::paginate(10);

        return view('warehouses.index')
            ->with('warehouses', $warehouses);
    }

    /**
     * Show the form for creating a new Warehouse.
     *
     * @return Response
     */
    public function create()
    {
        return view('warehouses.create');
    }

    /**
     * Store a newly created Warehouse in storage.
     *
     * @param CreateWarehouseRequest $request
     *
     * @return Response
     */
    public function store(CreateWarehouseRequest $request)
    {
        $input = $request->all();

        /** @var Warehouse $warehouse */
        $warehouse = Warehouse::create($input);

        Flash::success('Warehouse saved successfully.');

        return redirect(route('warehouses.index'));
    }

    /**
     * Display the specified Warehouse.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Warehouse $warehouse */
        $warehouse = Warehouse::find($id);

        if (empty($warehouse)) {
            Flash::error('Warehouse not found');

            return redirect(route('warehouses.index'));
        }

        return view('warehouses.show')->with('warehouse', $warehouse);
    }

    /**
     * Show the form for editing the specified Warehouse.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var Warehouse $warehouse */
        $warehouse = Warehouse::find($id);

        if (empty($warehouse)) {
            Flash::error('Warehouse not found');

            return redirect(route('warehouses.index'));
        }

        return view('warehouses.edit')->with('warehouse', $warehouse);
    }

    /**
     * Update the specified Warehouse in storage.
     *
     * @param int $id
     * @param UpdateWarehouseRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateWarehouseRequest $request)
    {
        /** @var Warehouse $warehouse */
        $warehouse = Warehouse::find($id);

        if (empty($warehouse)) {
            Flash::error('Warehouse not found');

            return redirect(route('warehouses.index'));
        }

        $warehouse->fill($request->all());
        $warehouse->save();

        Flash::success('Warehouse updated successfully.');

        return redirect(route('warehouses.index'));
    }

    /**
     * Remove the specified Warehouse from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Warehouse $warehouse */
        $warehouse = Warehouse::find($id);

        if (empty($warehouse)) {
            Flash::error('Warehouse not found');

            return redirect(route('warehouses.index'));
        }

        $warehouse->delete();

        Flash::success('Warehouse deleted successfully.');

        return redirect(route('warehouses.index'));
    }
}
