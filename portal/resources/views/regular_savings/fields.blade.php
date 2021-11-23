<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::number('member_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('amount', 'Amount:') !!}
    {!! Form::text('amount', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Frequency Field -->
<div class="form-group col-sm-6">
    {!! Form::label('frequency', 'Frequency:') !!}
    {!! Form::text('frequency', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Default Payment Method Field -->
<div class="form-group col-sm-6">
    {!! Form::label('default_payment_method', 'Default Payment Method:') !!}
    {!! Form::text('default_payment_method', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Autosave Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('autosave', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('autosave', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('autosave', 'Autosave', ['class' => 'form-check-label']) !!}
    </div>
</div>
