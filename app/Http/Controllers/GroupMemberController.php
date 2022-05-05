<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateGroupMemberRequest;
use App\Http\Requests\UpdateGroupMemberRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\GroupMember;
use Illuminate\Http\Request;
use Flash;
use Response;

class GroupMemberController extends AppBaseController
{
    /**
     * Display a listing of the GroupMember.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var GroupMember $groupMembers */
        $groupMembers = GroupMember::paginate(10);

        return view('group_members.index')
            ->with('groupMembers', $groupMembers);
    }

    /**
     * Show the form for creating a new GroupMember.
     *
     * @return Response
     */
    public function create()
    {
        return view('group_members.create');
    }

    /**
     * Store a newly created GroupMember in storage.
     *
     * @param CreateGroupMemberRequest $request
     *
     * @return Response
     */
    public function store(CreateGroupMemberRequest $request)
    {
        $input = $request->all();

        /** @var GroupMember $groupMember */
        $groupMember = GroupMember::create($input);

        Flash::success('Group Member saved successfully.');

        return redirect(route('groupMembers.index'));
    }

    /**
     * Display the specified GroupMember.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var GroupMember $groupMember */
        $groupMember = GroupMember::find($id);

        if (empty($groupMember)) {
            Flash::error('Group Member not found');

            return redirect(route('groupMembers.index'));
        }

        return view('group_members.show')->with('groupMember', $groupMember);
    }

    /**
     * Show the form for editing the specified GroupMember.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var GroupMember $groupMember */
        $groupMember = GroupMember::find($id);

        if (empty($groupMember)) {
            Flash::error('Group Member not found');

            return redirect(route('groupMembers.index'));
        }

        return view('group_members.edit')->with('groupMember', $groupMember);
    }

    /**
     * Update the specified GroupMember in storage.
     *
     * @param int $id
     * @param UpdateGroupMemberRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateGroupMemberRequest $request)
    {
        /** @var GroupMember $groupMember */
        $groupMember = GroupMember::find($id);

        if (empty($groupMember)) {
            Flash::error('Group Member not found');

            return redirect(route('groupMembers.index'));
        }

        $groupMember->fill($request->all());
        $groupMember->save();

        Flash::success('Group Member updated successfully.');

        return redirect(route('groupMembers.index'));
    }

    /**
     * Remove the specified GroupMember from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var GroupMember $groupMember */
        $groupMember = GroupMember::find($id);

        if (empty($groupMember)) {
            Flash::error('Group Member not found');

            return redirect(route('groupMembers.index'));
        }

        $groupMember->delete();

        Flash::success('Group Member deleted successfully.');

        return redirect(route('groupMembers.index'));
    }
}
