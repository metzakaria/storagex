<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member Id:') !!}
    <p>{{ $debitCard->member_id }}</p>
</div>

<!-- Card No Field -->
<div class="col-sm-12">
    {!! Form::label('card_no', 'Card No:') !!}
    <p>{{ $debitCard->card_no }}</p>
</div>

<!-- Expire Field -->
<div class="col-sm-12">
    {!! Form::label('expire', 'Expire:') !!}
    <p>{{ $debitCard->expire }}</p>
</div>

<!-- Cvv Field -->
<div class="col-sm-12">
    {!! Form::label('cvv', 'Cvv:') !!}
    <p>{{ $debitCard->cvv }}</p>
</div>

<!-- Issuing Bank Field -->
<div class="col-sm-12">
    {!! Form::label('issuing_bank', 'Issuing Bank:') !!}
    <p>{{ $debitCard->issuing_bank }}</p>
</div>

<!-- Card Type Field -->
<div class="col-sm-12">
    {!! Form::label('card_type', 'Card Type:') !!}
    <p>{{ $debitCard->card_type }}</p>
</div>

<!-- Datecreated Field -->
<div class="col-sm-12">
    {!! Form::label('datecreated', 'Datecreated:') !!}
    <p>{{ $debitCard->datecreated }}</p>
</div>

