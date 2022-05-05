@php 
    $farmers = DB::table('farmers')->get()->pluck('full_name','id')->prepend('Select a farmer', '');
    $warehouses = DB::table('warehouses')->get()->pluck('name','id')->prepend('Select a warehouse', '');
    $commodities = DB::table('commodities')->get()->pluck('name','id')->prepend('Select a Commodity', '');
@endphp
<!-- Farmer Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('farmer_id', 'Farmer:') !!}
    {!! Form::select('farmer_id', $farmers,null, ['class' => 'form-control']) !!}
</div>

<!-- Ware House Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('ware_house_id', 'Ware House:') !!}
    {!! Form::select('ware_house_id', $warehouses,null, ['class' => 'form-control']) !!}
</div>

<!-- Commodity Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('commodity_id', 'Commodity:') !!}
    {!! Form::select('commodity_id', $commodities, null, ['class' => 'form-control']) !!}
</div>

<!-- Qty Field -->
<div class="form-group col-sm-6">
    {!! Form::label('qty', 'Qty:') !!}
    {!! Form::text('qty', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>

<!-- Value Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('price', 'Price:') !!}
    {!! Form::number('price', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Is Removed Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_removed', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_removed', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_removed', 'Is Removed', ['class' => 'form-check-label']) !!}
    </div>
</div>

