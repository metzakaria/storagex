<!-- Transaction Ref Field -->
<div class="form-group col-sm-6">
    {!! Form::label('transaction_ref', 'Transaction Ref:') !!}
    {!! Form::text('transaction_ref', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Description Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('description', 'Description:') !!}
    {!! Form::textarea('description', null, ['class' => 'form-control']) !!}
</div>

<!-- Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('amount', 'Amount:') !!}
    {!! Form::text('amount', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Dr Cr Field -->
<div class="form-group col-sm-6">
    {!! Form::label('dr_cr', 'Dr Cr:') !!}
    {!! Form::text('dr_cr', null, ['class' => 'form-control','maxlength' => 4,'maxlength' => 4]) !!}
</div>

<!-- Date Transaction Field -->
<div class="form-group col-sm-6">
    {!! Form::label('date_transaction', 'Date Transaction:') !!}
    {!! Form::text('date_transaction', null, ['class' => 'form-control','id'=>'date_transaction']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#date_transaction').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Bal Affected Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('bal_affected', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('bal_affected', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('bal_affected', 'Bal Affected', ['class' => 'form-check-label']) !!}
    </div>
</div>


<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::number('member_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Pay Method Field -->
<div class="form-group col-sm-6">
    {!! Form::label('pay_method', 'Pay Method:') !!}
    {!! Form::text('pay_method', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>