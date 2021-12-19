<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\GroupMember;

use App\Models\GroupMsgReply;

use Flash;
use DB;

class groupMsgSubController extends Controller
{
    //

    public function groupMember($id)
    {
        $groupMembers = GroupMember::where('group_id', $id)->get();

        if(empty($groupMembers)){
            Flash::error('No Members for this group');

            return redirect(route('groups.index'));
        }

        return view('groups.members.index')->with('group_members', $groupMembers);
    }

    public function messageReplies($id)
    {
        $replies = GroupMsgReply::where('group_msg_id', $id)->get();
        if(empty($replies)){
            Flash::error('No Message Reply For This Message');

            return redirect(route('group_msgs.index'));
        }
        return view('group_msgs.replies.index')->with('replies', $replies);
    }
}
