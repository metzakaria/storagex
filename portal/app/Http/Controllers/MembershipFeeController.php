<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateMembershipFeeRequest;
use App\Http\Requests\UpdateMembershipFeeRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\MembershipFee;
use Illuminate\Http\Request;
use Flash;
use Response;

class MembershipFeeController extends AppBaseController
{
    /**
     * Display a listing of the MembershipFee.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var MembershipFee $membershipFees */
        $membershipFees = MembershipFee::all();

        return view('membership_fees.index')
            ->with('membershipFees', $membershipFees);
    }

    /**
     * Show the form for creating a new MembershipFee.
     *
     * @return Response
     */
    public function create()
    {
        return view('membership_fees.create');
    }

    /**
     * Store a newly created MembershipFee in storage.
     *
     * @param CreateMembershipFeeRequest $request
     *
     * @return Response
     */
    public function store(CreateMembershipFeeRequest $request)
    {
        $input = $request->all();

        /** @var MembershipFee $membershipFee */
        $membershipFee = MembershipFee::create($input);

        Flash::success('Membership Fee saved successfully.');

        return redirect(route('membershipFees.index'));
    }

    /**
     * Display the specified MembershipFee.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var MembershipFee $membershipFee */
        $membershipFee = MembershipFee::find($id);

        if (empty($membershipFee)) {
            Flash::error('Membership Fee not found');

            return redirect(route('membershipFees.index'));
        }

        return view('membership_fees.show')->with('membershipFee', $membershipFee);
    }

    /**
     * Show the form for editing the specified MembershipFee.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var MembershipFee $membershipFee */
        $membershipFee = MembershipFee::find($id);

        if (empty($membershipFee)) {
            Flash::error('Membership Fee not found');

            return redirect(route('membershipFees.index'));
        }

        return view('membership_fees.edit')->with('membershipFee', $membershipFee);
    }

    /**
     * Update the specified MembershipFee in storage.
     *
     * @param int $id
     * @param UpdateMembershipFeeRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateMembershipFeeRequest $request)
    {
        /** @var MembershipFee $membershipFee */
        $membershipFee = MembershipFee::find($id);

        if (empty($membershipFee)) {
            Flash::error('Membership Fee not found');

            return redirect(route('membershipFees.index'));
        }

        $membershipFee->fill($request->all());
        $membershipFee->save();

        Flash::success('Membership Fee updated successfully.');

        return redirect(route('membershipFees.index'));
    }

    /**
     * Remove the specified MembershipFee from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var MembershipFee $membershipFee */
        $membershipFee = MembershipFee::find($id);

        if (empty($membershipFee)) {
            Flash::error('Membership Fee not found');

            return redirect(route('membershipFees.index'));
        }

        $membershipFee->delete();

        Flash::success('Membership Fee deleted successfully.');

        return redirect(route('membershipFees.index'));
    }
}
