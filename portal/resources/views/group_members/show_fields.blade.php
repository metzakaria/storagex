<!-- Group Id Field -->
<div class="col-sm-12">
    {!! Form::label('group_id', 'Group Id:') !!}
    <p>{{ $groupMember->group_id }}</p>
</div>

<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member Id:') !!}
    <p>{{ $groupMember->member_id }}</p>
</div>

<!-- Group Owner Id Field -->
<div class="col-sm-12">
    {!! Form::label('group_owner_id', 'Group Owner Id:') !!}
    <p>{{ $groupMember->group_owner_id }}</p>
</div>

<!-- Date Created Field -->
<div class="col-sm-12">
    {!! Form::label('date_created', 'Date Created:') !!}
    <p>{{ $groupMember->date_created }}</p>
</div>

