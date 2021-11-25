<div class="col-lg-12 detail-view">

<!-- Full Name Field -->
<div class="col-sm-12">
    {!! Form::label('full_name', 'Full Name:') !!}
    <p>{{ $users->full_name }}</p>
</div>

<!-- Phone Field -->
<div class="col-sm-12">
    {!! Form::label('phone', 'Phone:') !!}
    <p>{{ $users->phone }}</p>
</div>

<!-- Email Field -->
<div class="col-sm-12">
    {!! Form::label('email', 'Email:') !!}
    <p>{{ $users->email }}</p>
</div>

{{-- <!-- Password Field -->
<div class="col-sm-12">
    {!! Form::label('password', 'Password:') !!}
    <p>{{ $users->password }}</p>
</div> --}}

<!-- Role Id Field -->
<div class="col-sm-12">
    {!! Form::label('role_id', 'Role Id:') !!}
    <p>{{ $users->role_id }}</p>
</div>

<!-- Is Active Field -->
<div class="col-sm-12">
    {!! Form::label('is_active', 'Is Active:') !!}
    <p>{{ $users->is_active }}</p>
</div>

<!-- Last Login Field -->
<div class="col-sm-12">
    {!! Form::label('last_login', 'Last Login:') !!}
    <p>{{ $users->last_login }}</p>
</div>

<!-- Remember Token Field -->
{{-- <div class="col-sm-12">
    {!! Form::label('remember_token', 'Remember Token:') !!}
    <p>{{ $users->remember_token }}</p>
</div> --}}

</div>

