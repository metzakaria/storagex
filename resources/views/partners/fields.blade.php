@php 
    $location = DB::table('locations')->get()->pluck('name','id')->prepend('Select a location', '');
    $assetype = DB::table('asset_types')->get()->pluck('name','id')->prepend('Select a Asset Type', '');
@endphp
<!-- Partner Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('partner_name', 'Partner Name:') !!}
    {!! Form::text('partner_name', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- State Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('location_id', 'Location:') !!}
    {!! Form::select('location_id',$location , null, ['class' => 'form-control']) !!}
</div>

<!-- Email Field -->
<div class="form-group col-sm-6">
    {!! Form::label('email', 'Email:') !!}
    {!! Form::email('email', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Phone Field -->
<div class="form-group col-sm-6">
    {!! Form::label('phone', 'Phone:') !!}
    {!! Form::text('phone', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Address Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('address', 'Address:') !!}
    {!! Form::text('address', null, ['class' => 'form-control']) !!}
</div>

<!-- Other Info Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('other_info', 'Other Info:') !!}
    {!! Form::text('other_info', null, ['class' => 'form-control']) !!}
</div>

<!-- Asset Type Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('asset_type_id', 'Asset Type:') !!}
    {!! Form::select('asset_type_id', $assetype,null, ['class' => 'form-control']) !!}
</div>

<!-- Insurance Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('insurance', 'Insurance:') !!}
    {!! Form::number('insurance', null, ['class' => 'form-control']) !!}
</div>
