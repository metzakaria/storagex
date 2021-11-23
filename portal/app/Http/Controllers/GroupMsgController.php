<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateGroupMsgRequest;
use App\Http\Requests\UpdateGroupMsgRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\GroupMsg;
use Illuminate\Http\Request;
use Flash;
use Response;

class GroupMsgController extends AppBaseController
{
    /**
     * Display a listing of the GroupMsg.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var GroupMsg $groupMsgs */
        $groupMsgs = GroupMsg::paginate(10);

        return view('group_msgs.index')
            ->with('groupMsgs', $groupMsgs);
    }

    /**
     * Show the form for creating a new GroupMsg.
     *
     * @return Response
     */
    public function create()
    {
        return view('group_msgs.create');
    }

    /**
     * Store a newly created GroupMsg in storage.
     *
     * @param CreateGroupMsgRequest $request
     *
     * @return Response
     */
    public function store(CreateGroupMsgRequest $request)
    {
        $input = $request->all();

        /** @var GroupMsg $groupMsg */
        $groupMsg = GroupMsg::create($input);

        Flash::success('Group Msg saved successfully.');

        return redirect(route('groupMsgs.index'));
    }

    /**
     * Display the specified GroupMsg.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var GroupMsg $groupMsg */
        $groupMsg = GroupMsg::find($id);

        if (empty($groupMsg)) {
            Flash::error('Group Msg not found');

            return redirect(route('groupMsgs.index'));
        }

        return view('group_msgs.show')->with('groupMsg', $groupMsg);
    }

    /**
     * Show the form for editing the specified GroupMsg.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var GroupMsg $groupMsg */
        $groupMsg = GroupMsg::find($id);

        if (empty($groupMsg)) {
            Flash::error('Group Msg not found');

            return redirect(route('groupMsgs.index'));
        }

        return view('group_msgs.edit')->with('groupMsg', $groupMsg);
    }

    /**
     * Update the specified GroupMsg in storage.
     *
     * @param int $id
     * @param UpdateGroupMsgRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateGroupMsgRequest $request)
    {
        /** @var GroupMsg $groupMsg */
        $groupMsg = GroupMsg::find($id);

        if (empty($groupMsg)) {
            Flash::error('Group Msg not found');

            return redirect(route('groupMsgs.index'));
        }

        $groupMsg->fill($request->all());
        $groupMsg->save();

        Flash::success('Group Msg updated successfully.');

        return redirect(route('groupMsgs.index'));
    }

    /**
     * Remove the specified GroupMsg from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var GroupMsg $groupMsg */
        $groupMsg = GroupMsg::find($id);

        if (empty($groupMsg)) {
            Flash::error('Group Msg not found');

            return redirect(route('groupMsgs.index'));
        }

        $groupMsg->delete();

        Flash::success('Group Msg deleted successfully.');

        return redirect(route('groupMsgs.index'));
    }
}
