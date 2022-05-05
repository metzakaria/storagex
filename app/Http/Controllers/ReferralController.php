<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateReferralRequest;
use App\Http\Requests\UpdateReferralRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\Referral;
use Illuminate\Http\Request;
use Flash;
use Response;

class ReferralController extends AppBaseController
{
    /**
     * Display a listing of the Referral.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var Referral $referrals */
        $referrals = Referral::paginate(10);

        return view('referrals.index')
            ->with('referrals', $referrals);
    }

    /**
     * Show the form for creating a new Referral.
     *
     * @return Response
     */
    public function create()
    {
        return view('referrals.create');
    }

    /**
     * Store a newly created Referral in storage.
     *
     * @param CreateReferralRequest $request
     *
     * @return Response
     */
    public function store(CreateReferralRequest $request)
    {
        $input = $request->all();

        /** @var Referral $referral */
        $referral = Referral::create($input);

        Flash::success('Referral saved successfully.');

        return redirect(route('referrals.index'));
    }

    /**
     * Display the specified Referral.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var Referral $referral */
        $referral = Referral::find($id);

        if (empty($referral)) {
            Flash::error('Referral not found');

            return redirect(route('referrals.index'));
        }

        return view('referrals.show')->with('referral', $referral);
    }

    /**
     * Show the form for editing the specified Referral.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var Referral $referral */
        $referral = Referral::find($id);

        if (empty($referral)) {
            Flash::error('Referral not found');

            return redirect(route('referrals.index'));
        }

        return view('referrals.edit')->with('referral', $referral);
    }

    /**
     * Update the specified Referral in storage.
     *
     * @param int $id
     * @param UpdateReferralRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateReferralRequest $request)
    {
        /** @var Referral $referral */
        $referral = Referral::find($id);

        if (empty($referral)) {
            Flash::error('Referral not found');

            return redirect(route('referrals.index'));
        }

        $referral->fill($request->all());
        $referral->save();

        Flash::success('Referral updated successfully.');

        return redirect(route('referrals.index'));
    }

    /**
     * Remove the specified Referral from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var Referral $referral */
        $referral = Referral::find($id);

        if (empty($referral)) {
            Flash::error('Referral not found');

            return redirect(route('referrals.index'));
        }

        $referral->delete();

        Flash::success('Referral deleted successfully.');

        return redirect(route('referrals.index'));
    }
}
