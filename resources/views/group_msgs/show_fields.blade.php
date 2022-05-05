<<<<<<< HEAD
@php
function getGroupName($groupID){

    return DB::table('groups')->where('id', $groupID)->value('name');

}

@endphp

<!-- Group Id Field -->
<div class="col-sm-12">
    {!! Form::label('group_id', 'Group Name:') !!}
    <p>{{ getGroupName($groupMsg->group_id) }}</p>
=======
<!-- Group Id Field -->
<div class="col-sm-12">
    {!! Form::label('group_id', 'Group Id:') !!}
    <p>{{ $groupMsg->group_id }}</p>
>>>>>>> emmybranch
</div>

<!-- Message Field -->
<div class="col-sm-12">
    {!! Form::label('message', 'Message:') !!}
    <p>{{ $groupMsg->message }}</p>
</div>

<!-- Created Menber Field -->
<div class="col-sm-12">
<<<<<<< HEAD
    {!! Form::label('created_menber', 'Created Member:') !!}
    <p>{{ $groupMsg->created_menber }}</p>
</div>





=======
    {!! Form::label('created_menber', 'Created Menber:') !!}
    <p>{{ $groupMsg->created_menber }}</p>
</div>

>>>>>>> emmybranch
