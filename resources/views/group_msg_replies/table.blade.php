<div class="table-responsive">
    <table class="table" id="groupMsgReplies-table">
        <thead>
            <tr>
                <th>Group Msg Id</th>
        <th>Replied Message</th>
        <th>Replied Member</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($groupMsgReplies as $groupMsgReply)
            <tr>
                <td>{{ $groupMsgReply->group_msg_id }}</td>
            <td>{{ $groupMsgReply->replied_message }}</td>
            <td>{{ $groupMsgReply->replied_member }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['groupMsgReplies.destroy', $groupMsgReply->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('groupMsgReplies.show', [$groupMsgReply->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('groupMsgReplies.edit', [$groupMsgReply->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-edit"></i>
                        </a>
                        {!! Form::button('<i class="far fa-trash-alt"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
