<!-- Reg Number Field -->
<div class="form-group col-sm-6">
    {!! Form::label('reg_number', 'Reg Number:') !!}
    {!! Form::text('reg_number', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>

<!-- Full Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('full_name', 'Full Name:') !!}
    {!! Form::text('full_name', null, ['class' => 'form-control','maxlength' => 200,'maxlength' => 200]) !!}
</div>

<!-- Email Field -->
<div class="form-group col-sm-6">
    {!! Form::label('email', 'Email:') !!}
    {!! Form::email('email', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Mobile Field -->
<div class="form-group col-sm-6">
    {!! Form::label('mobile', 'Mobile:') !!}
    {!! Form::text('mobile', null, ['class' => 'form-control','maxlength' => 14,'maxlength' => 14]) !!}
</div>

<!-- Produce Description Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('produce_description', 'Produce Description:') !!}
    {!! Form::text('produce_description', null, ['class' => 'form-control']) !!}
</div>

<!-- Address Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('address', 'Address:') !!}
    {!! Form::text('address', null, ['class' => 'form-control']) !!}
</div>

<!-- Photo Field -->
<div class="form-group col-sm-6">
    {!! Form::label('photo', 'Photo:') !!}
    {!! Form::file('photo', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Location Id Field -->
<div class="form-group col-sm-6">
@php 
    $location = DB::table('locations')->get()->pluck('name','id')->prepend('Select a location', '');
@endphp
    {!! Form::label('location_id', 'Location:') !!}
    {!! Form::select('location_id', $location, null, ['class' => 'form-control']) !!}
</div>


