<!-- Code Field -->
<div class="form-group col-sm-6">
    {!! Form::label('code', 'Code:') !!}
    {!! Form::text('code', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>

<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Unit Measure Field -->
<div class="form-group col-sm-6">
    {!! Form::label('unit_measure', 'Unit Measure:') !!}
    {!! Form::text('unit_measure', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>