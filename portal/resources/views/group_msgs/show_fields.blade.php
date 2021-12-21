@php
function getGroupName($groupID){

    return DB::table('groups')->where('id', $groupID)->value('name');

}

@endphp

<!-- Group Id Field -->
<div class="col-sm-12">
    {!! Form::label('group_id', 'Group Id:') !!}
    <p>{{ getGroupName($groupMsg->group_id) }}</p>
</div>

<!-- Message Field -->
<div class="col-sm-12">
    {!! Form::label('message', 'Message:') !!}
    <p>{{ $groupMsg->message }}</p>
</div>

<!-- Created Menber Field -->
<div class="col-sm-12">
    {!! Form::label('created_menber', 'Created Member:') !!}
    <p>{{ $groupMsg->created_menber }}</p>
</div>

<div class="col-sm-12">
    {!! Form::label('replies', 'Replies:') !!}
    @php
        function getMemberFullname($memberID){
            return DB::table('members')->where('id', $memberID)->value('full_name');
        }

        $replies = DB::table('group_msg_replies')->where('group_msg_id', $groupMsg->id)->get();
    @endphp

     @foreach($replies as $reply)
            <div class="row">
                <div class="col-sm-8">
                    <p  > {{ $reply->replied_message }}</p>
                </div>
                <div class="col-sm-2">{{getMemberFullname( $reply->replied_member )}}</div>
                <div class="col-sm-2">{{$reply->created_at }}</div>

            </div>
    @endforeach


</div>



