<div class="col-lg-12 detail-view">
<!-- Partner Name Field -->
<div class="col-sm-12">
    {!! Form::label('partner_name', 'Partner Name:') !!}
    <p>{{ $partner->partner_name }}</p>
</div>

<!-- State Id Field -->
<div class="col-sm-12">
    {!! Form::label('location_id', 'Location:') !!}
    <p>{{ $partner->location->name }}</p>
</div>


<!-- Email Field -->
<div class="col-sm-12">
    {!! Form::label('email', 'Email:') !!}
    <p>{{ $partner->email }}</p>
</div>

<!-- Phone Field -->
<div class="col-sm-12">
    {!! Form::label('phone', 'Phone:') !!}
    <p>{{ $partner->phone }}</p>
</div>

<!-- Address Field -->
<div class="col-sm-12">
    {!! Form::label('address', 'Address:') !!}
    <p>{{ $partner->address }}</p>
</div>

<!-- Other Info Field -->
<div class="col-sm-12">
    {!! Form::label('other_info', 'Other Info:') !!}
    <p>{{ $partner->other_info }}</p>
</div>

<!-- Asset Type Id Field -->
<div class="col-sm-12">
    {!! Form::label('asset_type_id', 'Asset Type:') !!}
    <p>{{ $partner->assettype->name }}</p>
</div>

<!-- Insurance Id Field -->
<div class="col-sm-12">
    {!! Form::label('insurance', 'Insurance:') !!}
    <p>{{ $partner->insurance }}</p>
</div>


</div>