<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateGroupMsgReplyRequest;
use App\Http\Requests\UpdateGroupMsgReplyRequest;
use App\Http\Controllers\AppBaseController;
use App\Models\GroupMsgReply;
use Illuminate\Http\Request;
use Flash;
use Response;

class GroupMsgReplyController extends AppBaseController
{
    /**
     * Display a listing of the GroupMsgReply.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        /** @var GroupMsgReply $groupMsgReplies */
        $groupMsgReplies = GroupMsgReply::paginate(10);

        return view('group_msg_replies.index')
            ->with('groupMsgReplies', $groupMsgReplies);
    }

    /**
     * Show the form for creating a new GroupMsgReply.
     *
     * @return Response
     */
    public function create()
    {
        return view('group_msg_replies.create');
    }

    /**
     * Store a newly created GroupMsgReply in storage.
     *
     * @param CreateGroupMsgReplyRequest $request
     *
     * @return Response
     */
    public function store(CreateGroupMsgReplyRequest $request)
    {
        $input = $request->all();

        /** @var GroupMsgReply $groupMsgReply */
        $groupMsgReply = GroupMsgReply::create($input);

        Flash::success('Group Msg Reply saved successfully.');

        return redirect(route('groupMsgReplies.index'));
    }

    /**
     * Display the specified GroupMsgReply.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        /** @var GroupMsgReply $groupMsgReply */
        $groupMsgReply = GroupMsgReply::find($id);

        if (empty($groupMsgReply)) {
            Flash::error('Group Msg Reply not found');

            return redirect(route('groupMsgReplies.index'));
        }

        return view('group_msg_replies.show')->with('groupMsgReply', $groupMsgReply);
    }

    /**
     * Show the form for editing the specified GroupMsgReply.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        /** @var GroupMsgReply $groupMsgReply */
        $groupMsgReply = GroupMsgReply::find($id);

        if (empty($groupMsgReply)) {
            Flash::error('Group Msg Reply not found');

            return redirect(route('groupMsgReplies.index'));
        }

        return view('group_msg_replies.edit')->with('groupMsgReply', $groupMsgReply);
    }

    /**
     * Update the specified GroupMsgReply in storage.
     *
     * @param int $id
     * @param UpdateGroupMsgReplyRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateGroupMsgReplyRequest $request)
    {
        /** @var GroupMsgReply $groupMsgReply */
        $groupMsgReply = GroupMsgReply::find($id);

        if (empty($groupMsgReply)) {
            Flash::error('Group Msg Reply not found');

            return redirect(route('groupMsgReplies.index'));
        }

        $groupMsgReply->fill($request->all());
        $groupMsgReply->save();

        Flash::success('Group Msg Reply updated successfully.');

        return redirect(route('groupMsgReplies.index'));
    }

    /**
     * Remove the specified GroupMsgReply from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        /** @var GroupMsgReply $groupMsgReply */
        $groupMsgReply = GroupMsgReply::find($id);

        if (empty($groupMsgReply)) {
            Flash::error('Group Msg Reply not found');

            return redirect(route('groupMsgReplies.index'));
        }

        $groupMsgReply->delete();

        Flash::success('Group Msg Reply deleted successfully.');

        return redirect(route('groupMsgReplies.index'));
    }
}
