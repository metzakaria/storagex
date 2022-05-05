
<!-- Invest Product Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('invest_product_id', 'Invest Product Id:') !!}
    {!! Form::number('invest_product_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::number('member_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Qty Bought Field -->
<div class="form-group col-sm-6">
    {!! Form::label('qty_bought', 'Qty Bought:') !!}
    {!! Form::text('qty_bought', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>

<!-- Amt Bought Field -->
<div class="form-group col-sm-6">
    {!! Form::label('amt_bought', 'Amt Bought:') !!}
    {!! Form::text('amt_bought', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Date Invest Field -->
<div class="form-group col-sm-6">
    {!! Form::label('date_invest', 'Date Invest:') !!}
    {!! Form::text('date_invest', null, ['class' => 'form-control','id'=>'date_invest']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#date_invest').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Expect Amt Return Field -->
<div class="form-group col-sm-6">
    {!! Form::label('expect_amt_return', 'Expect Amt Return:') !!}
    {!! Form::text('expect_amt_return', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Is Auctioned Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_auctioned', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_auctioned', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_auctioned', 'Is Auctioned', ['class' => 'form-check-label']) !!}
    </div>
</div>


<!-- Auction Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('auction_id', 'Auction Id:') !!}
    {!! Form::number('auction_id', null, ['class' => 'form-control']) !!}
</div>

<!-- T N C Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('t_n_c', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('t_n_c', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('t_n_c', 'T N C', ['class' => 'form-check-label']) !!}
    </div>
</div>


<!-- Payment Method Field -->
<div class="form-group col-sm-6">
    {!! Form::label('payment_method', 'Payment Method:') !!}
    {!! Form::text('payment_method', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>
