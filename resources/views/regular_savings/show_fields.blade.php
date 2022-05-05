<div class="col-lg-12 detail-view">
<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member:') !!}
    <p>{{ @$regularSaving->member->full_name }}</p>
</div>

<!-- Amount Field -->
<div class="col-sm-12">
    {!! Form::label('amount', 'Amount:') !!}
    <p>N{{ number_format($regularSaving->amount) }}</p>
</div>

<!-- Frequency Field -->
<div class="col-sm-12">
    {!! Form::label('frequency', 'Frequency:') !!}
    <p>{{ $regularSaving->frequency }}</p>
</div>

<!-- Default Payment Method Field -->
<div class="col-sm-12">
    {!! Form::label('default_payment_method', 'Default Payment Method:') !!}
    <p>{{ $regularSaving->default_payment_method }}</p>
</div>

<!-- Autosave Field -->
<div class="col-sm-12">
    {!! Form::label('autosave', 'Autosave:') !!}
    <p>{{ ($regularSaving->autosave==1)?'YES':'NO' }}</p>
</div>

</div>