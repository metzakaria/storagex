<div class="col-lg-12 detail-view">
<!-- Transaction Ref Field -->
<div class="col-sm-12">
    {!! Form::label('transaction_ref', 'Transaction Ref:') !!}
    <p>{{ $regularSavingsTransaction->transaction_ref }}</p>
</div>

<!-- Description Field -->
<div class="col-sm-12">
    {!! Form::label('description', 'Description:') !!}
    <p>{{ $regularSavingsTransaction->description }}</p>
</div>

<!-- Amount Field -->
<div class="col-sm-12">
    {!! Form::label('amount', 'Amount:') !!}
    <p>N{{ number_format($regularSavingsTransaction->amount) }}</p>
</div>

<!-- Dr Cr Field -->
<div class="col-sm-12">
    {!! Form::label('dr_cr', 'Type:') !!}
    <p>{{ $regularSavingsTransaction->dr_cr }}</p>
</div>

<!-- Date Transaction Field -->
<div class="col-sm-12">
    {!! Form::label('date_transaction', 'Date Transaction:') !!}
    <p>{{ $regularSavingsTransaction->date_transaction }}</p>
</div>

<!-- Bal Affected Field -->
<div class="col-sm-12">
    {!! Form::label('bal_affected', 'Ballance Affected:') !!}
    <p>{{ ($regularSavingsTransaction->bal_affected==1)?'YES':'NO' }}</p>
</div>

<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member:') !!}
    <p>{{ @$regularSavingsTransaction->member->full_name }}</p>
</div>

<!-- Pay Method Field -->
<div class="col-sm-12">
    {!! Form::label('pay_method', 'Pay Method:') !!}
    <p>{{ $regularSavingsTransaction->pay_method }}</p>
</div>

</div>