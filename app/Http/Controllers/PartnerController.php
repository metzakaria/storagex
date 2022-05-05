<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreatePartnerRequest;
use App\Http\Requests\UpdatePartnerRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\Partner;
use Illuminate\Http\Request;
use Flash;
use Response;

class PartnerController extends AppBaseController
{
    /**
     * Display a listing of the Partner.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var Partner $partners */
        $partners = Partner::paginate(10);

        return view('partners.index')
            ->with('partners', $partners);
    }

    /**
     * Show the form for creating a new Partner.
     *
     * @return Response
     */
    public function create()
    {
        return view('partners.create');
    }

    /**
     * Store a newly created Partner in storage.
     *
     * @param CreatePartnerRequest $request
     *
     * @return Response
     */
    public function store(CreatePartnerRequest $request)
    {
        $input = $request->all();

        /** @var Partner $partner */
        $partner = Partner::create($input);

        Flash::success('Partner saved successfully.');

        return redirect(route('partners.index'));
    }

    /**
     * Display the specified Partner.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Partner $partner */
        $partner = Partner::find($id);

        if (empty($partner)) {
            Flash::error('Partner not found');

            return redirect(route('partners.index'));
        }

        return view('partners.show')->with('partner', $partner);
    }

    /**
     * Show the form for editing the specified Partner.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var Partner $partner */
        $partner = Partner::find($id);

        if (empty($partner)) {
            Flash::error('Partner not found');

            return redirect(route('partners.index'));
        }

        return view('partners.edit')->with('partner', $partner);
    }

    /**
     * Update the specified Partner in storage.
     *
     * @param int $id
     * @param UpdatePartnerRequest $request
     *
     * @return Response
     */
    public function update($id, UpdatePartnerRequest $request)
    {
        /** @var Partner $partner */
        $partner = Partner::find($id);

        if (empty($partner)) {
            Flash::error('Partner not found');

            return redirect(route('partners.index'));
        }

        $partner->fill($request->all());
        $partner->save();

        Flash::success('Partner updated successfully.');

        return redirect(route('partners.index'));
    }

    /**
     * Remove the specified Partner from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Partner $partner */
        $partner = Partner::find($id);

        if (empty($partner)) {
            Flash::error('Partner not found');

            return redirect(route('partners.index'));
        }

        $partner->delete();

        Flash::success('Partner deleted successfully.');

        return redirect(route('partners.index'));
    }
}
