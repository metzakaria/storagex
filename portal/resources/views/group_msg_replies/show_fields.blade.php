<!-- Group Msg Id Field -->
<div class="col-sm-12">
    {!! Form::label('group_msg_id', 'Group Msg Id:') !!}
    <p>{{ $groupMsgReply->group_msg_id }}</p>
</div>

<!-- Replied Message Field -->
<div class="col-sm-12">
    {!! Form::label('replied_message', 'Replied Message:') !!}
    <p>{{ $groupMsgReply->replied_message }}</p>
</div>

<!-- Replied Member Field -->
<div class="col-sm-12">
    {!! Form::label('replied_member', 'Replied Member:') !!}
    <p>{{ $groupMsgReply->replied_member }}</p>
</div>

