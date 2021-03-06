@php
    function getLoginUserName($userID){
        return DB::table('users')->where('id', $userID)->value('full_name');
    }
@endphp

<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $group->name }}</p>
</div>

<!-- State Id Field -->
{{-- <div class="col-sm-12">
    {!! Form::label('state_id', 'State Id:') !!}
    <p>{{ $group->state_id }}</p>
</div>

<!-- Lga Id Field -->
<div class="col-sm-12">
    {!! Form::label('lga_id', 'Lga Id:') !!}
    <p>{{ $group->lga_id }}</p>
</div> --}}

<!-- Created Menber Field -->
<div class="col-sm-12">
    {!! Form::label('created_menber', 'Created Member:') !!}
    <p>{{ getLoginUserName($group->created_menber) }}</p>
</div>

