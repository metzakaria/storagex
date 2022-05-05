<div class="col-lg-9 detail-view">
<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $investmentProduct->name }}</p>
</div>

<!-- Description Field -->
<div class="col-sm-12">
    {!! Form::label('description', 'Description:') !!}
    <p>{{ $investmentProduct->description }}</p>
</div>

<!-- Invest Type Field -->
<div class="col-sm-12">
    {!! Form::label('invest_type', 'Invest Type:') !!}
    <p>{{ $investmentProduct->invest_type }}</p>
</div>

<!-- Unit Interest Field -->
<div class="col-sm-12">
    {!! Form::label('unit_interest', 'Unit Interest:') !!}
    <p>%{{ $investmentProduct->unit_interest }}</p>
</div>

<!-- Unit Amount Field -->
<div class="col-sm-12">
    {!! Form::label('unit_amount', 'Unit Amount:') !!}
    <p>N{{ number_format($investmentProduct->unit_amount,2) }}</p>
</div>

<!-- Quantity Field -->
<div class="col-sm-12">
    {!! Form::label('quantity', 'Quantity:') !!}
    <p>{{ $investmentProduct->quantity }}</p>
</div>


<!-- Qty Sold Field -->
<div class="col-sm-12">
    {!! Form::label('qty_sold', 'Qty Sold:') !!}
    <p>{{ $investmentProduct->qty_sold }}</p>
</div>

<!-- Is Active Field -->
<div class="col-sm-12">
    {!! Form::label('is_active', 'Is Active:') !!}
    <p>{{ ($investmentProduct->is_active==1)?'YES':'NO' }}</p>
</div>

<!-- Created By Field -->
<div class="col-sm-12">
    {!! Form::label('created_by', 'Created By:') !!}
    <p>{{ @$investmentProduct->createdby->full_name }}</p>
</div>

<!-- Start Date Field -->
<div class="col-sm-12">
    {!! Form::label('start_date', 'Start Date:') !!}
    <p>{{ $investmentProduct->start_date }}</p>
</div>

<!-- Mature Date Field -->
<div class="col-sm-12">
    {!! Form::label('mature_date', 'Mature Date:') !!}
    <p>{{ $investmentProduct->mature_date }}</p>
</div>

<!-- Location Field -->
<div class="col-sm-12">
    {!! Form::label('location', 'Location:') !!}
    <p>{{ @$investmentProduct->location->name }}</p>
</div>

<!-- Insurance Id Field -->
<div class="col-sm-12">
    {!! Form::label('insurance', 'Insurance:') !!}
    <p>{{ $investmentProduct->insurance }}</p>
</div>

<!-- Is Auctionable Field -->
<div class="col-sm-12">
    {!! Form::label('is_auctionable', 'Is Auctionable:') !!}
    <p>{{ ($investmentProduct->is_auctionable==1)?'YES':'NO' }}</p>
</div>

<!-- Provided By Field -->
<div class="col-sm-12">
    {!! Form::label('provided_by', 'Provided By:') !!}
    <p>{{ $investmentProduct->provided_by }}</p>
</div>

<!-- Is Matured Field -->
<div class="col-sm-12">
    {!! Form::label('is_matured', 'Is Matured:') !!}
    <p>{{ ($investmentProduct->is_matured==1)?'YES':'NO' }}</p>
</div>

<!-- Investors Field -->
<div class="col-sm-12">
    {!! Form::label('investors', 'Investors:') !!}
    <p>{{ $investmentProduct->investors }}</p>
</div>
</div>
<div class="col-lg-3 text-center">
<h5>Product Image</h5>
@php $img = ($investmentProduct->image_file)?$investmentProduct->image_file:'no_pix.jpg'; @endphp 
    <img src="{{ asset('storage/images/investments/'.$img) }}" width="150" height="150" />
    
</div>
