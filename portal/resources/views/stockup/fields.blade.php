

<div class="form-group col-sm-6">
    {!! Form::label('item_name', 'Item Name:') !!}
    {!! Form::text('item_name', null, ['class' => 'form-control','maxlength' => 250,'maxlength' => 250]) !!}
</div>

<div class="form-group col-sm-6">
    {!! Form::label('quantity', 'Quantity:') !!}
    {!! Form::number('quantity', null, ['class' => 'form-control','maxlength' => 250,'maxlength' => 250]) !!}
</div>

<div class="form-group col-sm-6">
    {!! Form::label('price_per_unit', 'Price Per Unit:') !!}
    {!! Form::text('price_per_unit', null, ['class' => 'form-control','maxlength' => 250,'maxlength' => 250]) !!}
</div>

<div class="form-group col-sm-6">
    {!! Form::label('item_image', 'Item Image:') !!}
    {!! Form::file('item_image', null, ['class' => 'form-control','maxlength' => 250,'maxlength' => 250]) !!}
</div>

<div class="form-group col-sm-6">
    {!! Form::label('unit', 'Unit:') !!}
    {!! Form::number('unit', null, ['class' => 'form-control','maxlength' => 250,'maxlength' => 250]) !!}
</div>

<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('in_stock', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('in_stock', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('in_stock', 'Is Stock', ['class' => 'form-check-label']) !!}
    </div>
</div>

<div class="form-group col-sm-6">
    {!! Form::label('description', 'Description:') !!}
    {!! Form::textarea('description', null, ['class' => 'form-control','maxlength' => 250,'maxlength' => 250]) !!}
</div>
