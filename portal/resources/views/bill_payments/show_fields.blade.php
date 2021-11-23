<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member Id:') !!}
    <p>{{ $billPayment->member_id }}</p>
</div>

<!-- Bill Type Field -->
<div class="col-sm-12">
    {!! Form::label('bill_type', 'Bill Type:') !!}
    <p>{{ $billPayment->bill_type }}</p>
</div>

<!-- Amount Field -->
<div class="col-sm-12">
    {!! Form::label('amount', 'Amount:') !!}
    <p>{{ $billPayment->amount }}</p>
</div>

<!-- Fee Field -->
<div class="col-sm-12">
    {!! Form::label('fee', 'Fee:') !!}
    <p>{{ $billPayment->fee }}</p>
</div>

<!-- Receiver Account Field -->
<div class="col-sm-12">
    {!! Form::label('receiver_account', 'Receiver Account:') !!}
    <p>{{ $billPayment->receiver_account }}</p>
</div>

<!-- Description Field -->
<div class="col-sm-12">
    {!! Form::label('description', 'Description:') !!}
    <p>{{ $billPayment->description }}</p>
</div>

<!-- Is Paid Field -->
<div class="col-sm-12">
    {!! Form::label('is_paid', 'Is Paid:') !!}
    <p>{{ $billPayment->is_paid }}</p>
</div>

<!-- Date Paid Field -->
<div class="col-sm-12">
    {!! Form::label('date_paid', 'Date Paid:') !!}
    <p>{{ $billPayment->date_paid }}</p>
</div>

<!-- Date Created Field -->
<div class="col-sm-12">
    {!! Form::label('date_created', 'Date Created:') !!}
    <p>{{ $billPayment->date_created }}</p>
</div>

