<!-- Group Id Field -->
<div class="col-sm-12">
    {!! Form::label('group_id', 'Group Id:') !!}
    <p>{{ $groupMsg->group_id }}</p>
</div>

<!-- Message Field -->
<div class="col-sm-12">
    {!! Form::label('message', 'Message:') !!}
    <p>{{ $groupMsg->message }}</p>
</div>

<!-- Created Menber Field -->
<div class="col-sm-12">
    {!! Form::label('created_menber', 'Created Menber:') !!}
    <p>{{ $groupMsg->created_menber }}</p>
</div>

