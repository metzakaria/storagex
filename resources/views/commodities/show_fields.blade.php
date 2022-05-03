<!-- Code Field -->
<div class="col-sm-12">
    {!! Form::label('code', 'Code:') !!}
    <p>{{ $commodity->code }}</p>
</div>

<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $commodity->name }}</p>
</div>

<!-- Unit Measure Field -->
<div class="col-sm-12">
    {!! Form::label('unit_measure', 'Unit Measure:') !!}
    <p>{{ $commodity->unit_measure }}</p>
</div>

