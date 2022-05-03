<div class="col-lg-12 detail-view">
<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member:') !!}
    <p>{{ $referral->member->full_name }}</p>
</div>

<!-- Referred Member Field -->
<div class="col-sm-12">
    {!! Form::label('referred_member', 'Referred By:') !!}
    <p>{{ $referral->referredmember->full_name }}</p>
</div>

<!-- Commission Field -->
<div class="col-sm-12">
    {!! Form::label('commission', 'Commission:') !!}
    <p>N{{ number_format($referral->commission,2) }}</p>
</div>

<!-- Is Paid Field -->
<div class="col-sm-12">
    {!! Form::label('is_paid', 'Is Paid:') !!}
    <p>{{ ($referral->is_paid==1)?'YES':'NO' }}</p>
</div>

<!-- Date Paid Field -->
<div class="col-sm-12">
    {!! Form::label('date_paid', 'Date Paid:') !!}
    <p>{{ $referral->date_paid }}</p>
</div>

<!-- Date Created Field -->
<div class="col-sm-12">
    {!! Form::label('date_created', 'Date Created:') !!}
    <p>{{ $referral->date_created }}</p>
</div>
</div>

