<div class="col-lg-12 detail-view">
<!-- Invest Product Id Field -->
<div class="col-sm-12">
    {!! Form::label('invest_product_id', 'Invest Product:') !!}
    <p>{{ $investment->investmentproduct->name }}</p>
</div>

<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member:') !!}
    <p>{{ $investment->member->full_name }}</p>
</div>

<!-- Qty Bought Field -->
<div class="col-sm-12">
    {!! Form::label('qty_bought', 'Qty Bought:') !!}
    <p>{{ $investment->qty_bought }}</p>
</div>

<!-- Amt Bought Field -->
<div class="col-sm-12">
    {!! Form::label('amt_bought', 'Amt Bought:') !!}
    <p>N{{ number_format($investment->amt_bought,2) }}</p>
</div>

<!-- Date Invest Field -->
<div class="col-sm-12">
    {!! Form::label('date_invest', 'Date Invest:') !!}
    <p>{{ $investment->date_invest }}</p>
</div>

<!-- Expect Amt Return Field -->
<div class="col-sm-12">
    {!! Form::label('expect_amt_return', 'Expect Amt Return:') !!}
    <p>N{{ number_format($investment->expect_amt_return,2) }}</p>
</div>

<!-- Is Auctioned Field -->
<div class="col-sm-12">
    {!! Form::label('is_auctioned', 'Is Auctioned:') !!}
    <p>{{ ($investment->is_auctioned==1)?'YES':'NO' }}</p>
</div>

<!-- T N C Field -->
<div class="col-sm-12">
    {!! Form::label('t_n_c', 'Accept T & C:') !!}
    <p>{{ ($investment->t_n_c==1)?'YES':'NO' }}</p>
</div>

</div>