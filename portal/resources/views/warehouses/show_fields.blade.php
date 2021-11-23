<div class="col-lg-12 detail-view">
<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $warehouse->name }}</p>
</div>

<!-- Description Field -->
<div class="col-sm-12">
    {!! Form::label('description', 'Description:') !!}
    <p>{{ $warehouse->description }}</p>
</div>

<!-- Location Id Field -->
<div class="col-sm-12">
    {!! Form::label('location_id', 'Location:') !!}
    <p>{{ @$warehouse->location->name }}</p>
</div>

<!-- Insurance Field -->
<div class="col-sm-12">
    {!! Form::label('insurance', 'Insurance:') !!}
    <p>{{ $warehouse->insurance }}</p>
</div>

<!-- Policy Number Field -->
<div class="col-sm-12">
    {!! Form::label('policy_number', 'Policy Number:') !!}
    <p>{{ $warehouse->policy_number }}</p>
</div>

</div>