<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member Id:') !!}
    <p>{{ $membershipFee->member_id }}</p>
</div>

<!-- Amount Field -->
<div class="col-sm-12">
    {!! Form::label('amount', 'Amount:') !!}
    <p>{{ $membershipFee->amount }}</p>
</div>

<!-- Start Date Field -->
<div class="col-sm-12">
    {!! Form::label('start_date', 'Start Date:') !!}
    <p>{{ $membershipFee->start_date }}</p>
</div>

<!-- End Date Field -->
<div class="col-sm-12">
    {!! Form::label('end_date', 'End Date:') !!}
    <p>{{ $membershipFee->end_date }}</p>
</div>

<!-- Date Created Field -->
<div class="col-sm-12">
    {!! Form::label('date_created', 'Date Created:') !!}
    <p>{{ $membershipFee->date_created }}</p>
</div>

