<div class="col-sm-9 detail-view">

<!-- Full Name Field -->
<div class="col-sm-12">
    {!! Form::label('full_name', 'Full Name:') !!}
    <p>{{ $member->full_name }}</p>
</div>

<!-- Email Field -->
<div class="col-sm-12">
    {!! Form::label('email', 'Email:') !!}
    <p>{{ $member->email }}</p>
</div>

<!-- Mobile Field -->
<div class="col-sm-12">
    {!! Form::label('mobile', 'Mobile:') !!}
    <p>{{ $member->mobile }}</p>
</div>

<!-- Address Field -->
<div class="col-sm-12">
    {!! Form::label('address', 'Address:') !!}
    <p>{{ $member->address }}</p>
</div>

<!-- Security Question Field -->
<div class="col-sm-12">
    {!! Form::label('security_question', 'Security Question:') !!}
    <p>{{ $member->security_question }}</p>
</div>

<!-- Security Ans Field -->
<div class="col-sm-12">
    {!! Form::label('security_ans', 'Security Ans:') !!}
    <p>{{ "****************" }}</p>
</div>

<!-- Bvn Field -->
<div class="col-sm-12">
    {!! Form::label('bvn', 'Bvn:') !!}
    <p>{{ $member->bvn }}</p>
</div>

<!-- Bank Id Field -->
<div class="col-sm-12">
    {!! Form::label('bank_id', 'Bank:') !!}
    <p>{{ @$member->bank->bank_name }}</p>
</div>

<!-- Account No Field -->
<div class="col-sm-12">
    {!! Form::label('account_no', 'Account No:') !!}
    <p>{{ $member->account_no }}</p>
</div>

<!-- Account Name Field -->
<div class="col-sm-12">
    {!! Form::label('account_name', 'Account Name:') !!}
    <p>{{ $member->account_name }}</p>
</div>

<!-- Is Bank Verified Field -->
<div class="col-sm-12">
    {!! Form::label('is_verified', 'Is Bank Verified:') !!}
    <p>{{ ($member->is_verified==1)?'YES':'NO' }}</p>
</div>

<!-- Dob Field -->
<div class="col-sm-12">
    {!! Form::label('dob', 'Dob:') !!}
    <p>{{ $member->dob }}</p>
</div>

<!-- Identity Type Id Field -->
<div class="col-sm-12">
    {!! Form::label('identity_type_id', 'Identity Type:') !!}
    <p>{{ @$member->identity_type->identity_name }}</p>
</div>



<!-- Is Active Field -->
<div class="col-sm-12">
    {!! Form::label('is_active', 'Is Active:') !!}
    <p>{{ ($member->is_active==1)?'YES':'NO' }}</p>
</div>

<!-- Is Deleted Field -->
<div class="col-sm-12">
    {!! Form::label('is_deleted', 'Is Deleted:') !!}
    <p>{{ $member->is_deleted }}</p>
</div>

<!-- Referral Code Field -->
<div class="col-sm-12">
    {!! Form::label('referral_code', 'Referral Code:') !!}
    <p>{{ $member->referral_code }}</p>
</div>

<!-- Cur Bal Field -->
<div class="col-sm-12">
    {!! Form::label('cur_bal', 'Cur Bal:') !!}
    <p>{{ $member->cur_bal }}</p>
</div>

<!-- Prev Bal Field -->
<div class="col-sm-12">
    {!! Form::label('prev_bal', 'Prev Bal:') !!}
    <p>{{ $member->prev_bal }}</p>
</div>


<!-- Cur Invest Bal Field -->
<div class="col-sm-12">
    {!! Form::label('cur_invest_bal', 'Cur Invest Bal:') !!}
    <p>{{ $member->cur_invest_bal }}</p>
</div>

<!-- Prev Invest Bal Field -->
<div class="col-sm-12">
    {!! Form::label('prev_invest_bal', 'Prev Invest Bal:') !!}
    <p>{{ $member->prev_invest_bal }}</p>
</div>

<!-- Storagex Bank Id Field -->
<div class="col-sm-12">
    {!! Form::label('storagex_bank_id', 'Storagex Bank Id:') !!}
    <p>{{ $member->storagex_bank_id }}</p>
</div>

<!-- Storagex Acct No Field -->
<div class="col-sm-12">
    {!! Form::label('storagex_acct_no', 'Storagex Acct No:') !!}
    <p>{{ $member->storagex_acct_no }}</p>
</div>

<!-- Disable Wallet Bal Field -->
<div class="col-sm-12">
    {!! Form::label('disable_wallet_bal', 'Disable Wallet Bal:') !!}
    <p>{{ $member->disable_wallet_bal }}</p>
</div>

</div>

<div class="col-sm-3 text-center">
    <h5>Photo</h5>
    @php 
    $img = ($member->photo)?$member->photo:'no_pix.jpg';
    $identity = ($member->identity_image)?$member->identity_image:'no_pix.jpg';
     @endphp 
    <img src="{{ asset('storage/images/members/'.$img) }}" width="150" height="150" />
    <br><br>
    <h5>Identity Image</h5>
    <img src="{{ asset('storage/images/identities/'.$identity) }}" width="150"  />
</div>