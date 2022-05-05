@php 
    $location = DB::table('locations')->get()->pluck('name','id')->prepend('Select a location', '');
@endphp
<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>
<!-- Location Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('location_id', 'Location:') !!}
    {!! Form::select('location_id',$location, null, ['class' => 'form-control']) !!}
</div>
<!-- Description Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('description', 'Description:') !!}
    {!! Form::text('description', null, ['class' => 'form-control']) !!}
</div>



<!-- Insurance Field -->
<div class="form-group col-sm-6">
    {!! Form::label('insurance', 'Insurance:') !!}
    {!! Form::text('insurance', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Policy Number Field -->
<div class="form-group col-sm-6">
    {!! Form::label('policy_number', 'Policy Number:') !!}
    {!! Form::text('policy_number', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>