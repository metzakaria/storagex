@php 
    $banks = DB::table('banks')->get()->pluck('bank_name','id')->prepend('Select a bank', '');
    $idtypes = DB::table('identity_types')->get()->pluck('identity_name','id')->prepend('Select a ID Type', '');
@endphp

<!-- Full Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('full_name', 'Full Name:') !!}
    {!! Form::text('full_name', null, ['class' => 'form-control','maxlength' => 250,'maxlength' => 250]) !!}
</div>

<!-- Email Field -->
<div class="form-group col-sm-6">
    {!! Form::label('email', 'Email:') !!}
    {!! Form::email('email', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Mobile Field -->
<div class="form-group col-sm-6">
    {!! Form::label('mobile', 'Mobile:') !!}
    {!! Form::text('mobile', null, ['class' => 'form-control','maxlength' => 14,'maxlength' => 14]) !!}
</div>
<!-- Bvn Field -->
<div class="form-group col-sm-6">
    {!! Form::label('bvn', 'Bvn:') !!}
    {!! Form::text('bvn', null, ['class' => 'form-control','maxlength' => 14,'maxlength' => 14]) !!}
</div>

<!-- Address Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('address', 'Address:') !!}
    {!! Form::text('address', null, ['class' => 'form-control']) !!}
</div>

<!-- Security Question Field -->
<div class="form-group col-sm-6">
    {!! Form::label('security_question', 'Security Question:') !!}
    {!! Form::text('security_question', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Security Ans Field -->
<div class="form-group col-sm-6">
    {!! Form::label('security_ans', 'Security Ans:') !!}
    {!! Form::text('security_ans', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>
<!-- Photo Field -->
<div class="form-group col-sm-6">
    {!! Form::label('photo', 'Photo:') !!}
    {!! Form::file('photo', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>


<!-- Bank Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('bank_id', 'Bank Id:') !!}
    {!! Form::select('bank_id', $banks, null, ['class' => 'form-control']) !!}
</div>


<!-- Account No Field -->
<div class="form-group col-sm-6">
    {!! Form::label('account_no', 'Account No:') !!}
    {!! Form::text('account_no', null, ['class' => 'form-control','maxlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- Account Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('account_name', 'Account Name:') !!}
    {!! Form::text('account_name', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Is Bank Verified Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_verified', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_verified', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_verified', 'Is Verified', ['class' => 'form-check-label']) !!}
    </div>
</div>


<!-- Dob Field -->
<div class="form-group col-sm-6">
    {!! Form::label('dob', 'Dob:') !!}
    {!! Form::text('dob', null, ['class' => 'form-control','maxlength' => 8,'maxlength' => 8]) !!}
</div>

<!-- Identity Type Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('identity_type_id', 'Identity Type Id:') !!}
    {!! Form::select('identity_type_id', $idtypes, null, ['class' => 'form-control']) !!}
</div>

<!-- Identity Image Field -->
<div class="form-group col-sm-6">
    {!! Form::label('identity_image', 'Identity Image:') !!}
    {!! Form::file('identity_image', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Is Active Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_active', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_active', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_active', 'Is Active', ['class' => 'form-check-label']) !!}
    </div>
</div>


<!-- Is Deleted Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_deleted', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_deleted', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_deleted', 'Is Deleted', ['class' => 'form-check-label']) !!}
    </div>
</div>

