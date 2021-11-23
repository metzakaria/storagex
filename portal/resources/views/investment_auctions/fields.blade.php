<!-- Investment Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('investment_id', 'Investment Id:') !!}
    {!! Form::number('investment_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Invest Product Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('invest_product_id', 'Invest Product Id:') !!}
    {!! Form::number('invest_product_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Qty Offer Field -->
<div class="form-group col-sm-6">
    {!! Form::label('qty_offer', 'Qty Offer:') !!}
    {!! Form::text('qty_offer', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>

<!-- Unit Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('unit_amount', 'Unit Amount:') !!}
    {!! Form::text('unit_amount', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Total Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('total_amount', 'Total Amount:') !!}
    {!! Form::text('total_amount', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Is Sold Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_sold', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_sold', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_sold', 'Is Sold', ['class' => 'form-check-label']) !!}
    </div>
</div>


<!-- Date Sold Field -->
<div class="form-group col-sm-6">
    {!! Form::label('date_sold', 'Date Sold:') !!}
    {!! Form::text('date_sold', null, ['class' => 'form-control','id'=>'date_sold']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#date_sold').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Boughtby Member Field -->
<div class="form-group col-sm-6">
    {!! Form::label('boughtby_member', 'Boughtby Member:') !!}
    {!! Form::number('boughtby_member', null, ['class' => 'form-control']) !!}
</div>

<!-- Date Created Field -->
<div class="form-group col-sm-6">
    {!! Form::label('date_created', 'Date Created:') !!}
    {!! Form::text('date_created', null, ['class' => 'form-control','id'=>'date_created']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#date_created').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Offer Close At Field -->
<div class="form-group col-sm-6">
    {!! Form::label('offer_close_at', 'Offer Close At:') !!}
    {!! Form::text('offer_close_at', null, ['class' => 'form-control','id'=>'offer_close_at']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#offer_close_at').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- T N C Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('t_n_c', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('t_n_c', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('t_n_c', 'T N C', ['class' => 'form-check-label']) !!}
    </div>
</div>
