<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCommodityRequest;
use App\Http\Requests\UpdateCommodityRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\Commodity;
use Illuminate\Http\Request;
use Flash;
use Response;

class CommodityController extends AppBaseController
{
    /**
     * Display a listing of the Commodity.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var Commodity $commodities */
        $commodities = Commodity::all();

        return view('commodities.index')
            ->with('commodities', $commodities);
    }

    /**
     * Show the form for creating a new Commodity.
     *
     * @return Response
     */
    public function create()
    {
        return view('commodities.create');
    }

    /**
     * Store a newly created Commodity in storage.
     *
     * @param CreateCommodityRequest $request
     *
     * @return Response
     */
    public function store(CreateCommodityRequest $request)
    {
        $input = $request->all();

        /** @var Commodity $commodity */
        $commodity = Commodity::create($input);

        Flash::success('Commodity saved successfully.');

        return redirect(route('commodities.index'));
    }

    /**
     * Display the specified Commodity.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Commodity $commodity */
        $commodity = Commodity::find($id);

        if (empty($commodity)) {
            Flash::error('Commodity not found');

            return redirect(route('commodities.index'));
        }

        return view('commodities.show')->with('commodity', $commodity);
    }

    /**
     * Show the form for editing the specified Commodity.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var Commodity $commodity */
        $commodity = Commodity::find($id);

        if (empty($commodity)) {
            Flash::error('Commodity not found');

            return redirect(route('commodities.index'));
        }

        return view('commodities.edit')->with('commodity', $commodity);
    }

    /**
     * Update the specified Commodity in storage.
     *
     * @param int $id
     * @param UpdateCommodityRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCommodityRequest $request)
    {
        /** @var Commodity $commodity */
        $commodity = Commodity::find($id);

        if (empty($commodity)) {
            Flash::error('Commodity not found');

            return redirect(route('commodities.index'));
        }

        $commodity->fill($request->all());
        $commodity->save();

        Flash::success('Commodity updated successfully.');

        return redirect(route('commodities.index'));
    }

    /**
     * Remove the specified Commodity from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Commodity $commodity */
        $commodity = Commodity::find($id);

        if (empty($commodity)) {
            Flash::error('Commodity not found');

            return redirect(route('commodities.index'));
        }

        $commodity->delete();

        Flash::success('Commodity deleted successfully.');

        return redirect(route('commodities.index'));
    }
}
