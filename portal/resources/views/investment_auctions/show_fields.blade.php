<div class="col-lg-12 detail-view">
<!-- Investment Id Field -->
<div class="col-sm-12">
    {!! Form::label('investment_id', 'Offer By:') !!}
    <p>{{ @$investmentAuction->investment->member->full_name }}</p>
</div>

<!-- Invest Product Id Field -->
<div class="col-sm-12">
    {!! Form::label('invest_product_id', 'Investment Product:') !!}
    <p>{{ $investmentAuction->investment_product->name }}</p>
</div>

<!-- Qty Offer Field -->
<div class="col-sm-12">
    {!! Form::label('qty_offer', 'Qty Offer:') !!}
    <p>{{ $investmentAuction->qty_offer }}</p>
</div>

<!-- Unit Amount Field -->
<div class="col-sm-12">
    {!! Form::label('unit_amount', 'Unit Amount:') !!}
    <p>N{{ number_format($investmentAuction->unit_amount) }}</p>
</div>

<!-- Total Amount Field -->
<div class="col-sm-12">
    {!! Form::label('total_amount', 'Total Amount:') !!}
    <p>N{{ number_format($investmentAuction->total_amount,2) }}</p>
</div>

<!-- Is Sold Field -->
<div class="col-sm-12">
    {!! Form::label('is_sold', 'Is Sold:') !!}
    <p>{{ ($investmentAuction->is_sold==1)?'YES':'NO' }}</p>
</div>

<!-- Date Sold Field -->
<div class="col-sm-12">
    {!! Form::label('date_sold', 'Date Sold:') !!}
    <p>{{ $investmentAuction->date_sold }}</p>
</div>

<!-- Boughtby Member Field -->
<div class="col-sm-12">
    {!! Form::label('boughtby_member', 'Boughtby Member:') !!}
    <p>{{ $investmentAuction->boughtbymember->full_name }}</p>
</div>

<!-- Date Created Field -->
<div class="col-sm-12">
    {!! Form::label('date_created', 'Date Created:') !!}
    <p>{{ $investmentAuction->date_created }}</p>
</div>

<!-- Offer Close At Field -->
<div class="col-sm-12">
    {!! Form::label('offer_close_at', 'Offer Close At:') !!}
    <p>{{ $investmentAuction->offer_close_at }}</p>
</div>

<!-- T N C Field -->
<div class="col-sm-12">
    {!! Form::label('t_n_c', 'Accept T & C:') !!}
    <p>{{ ($investmentAuction->t_n_c==1)?'YES':'NO' }}</p>
</div>

</div>