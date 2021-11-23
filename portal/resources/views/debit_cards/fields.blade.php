<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::number('member_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Card No Field -->
<div class="form-group col-sm-6">
    {!! Form::label('card_no', 'Card No:') !!}
    {!! Form::text('card_no', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Expire Field -->
<div class="form-group col-sm-6">
    {!! Form::label('expire', 'Expire:') !!}
    {!! Form::text('expire', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Cvv Field -->
<div class="form-group col-sm-6">
    {!! Form::label('cvv', 'Cvv:') !!}
    {!! Form::text('cvv', null, ['class' => 'form-control','maxlength' => 5,'maxlength' => 5]) !!}
</div>

<!-- Issuing Bank Field -->
<div class="form-group col-sm-6">
    {!! Form::label('issuing_bank', 'Issuing Bank:') !!}
    {!! Form::number('issuing_bank', null, ['class' => 'form-control']) !!}
</div>

<!-- Card Type Field -->
<div class="form-group col-sm-6">
    {!! Form::label('card_type', 'Card Type:') !!}
    {!! Form::text('card_type', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Datecreated Field -->
<div class="form-group col-sm-6">
    {!! Form::label('datecreated', 'Datecreated:') !!}
    {!! Form::text('datecreated', null, ['class' => 'form-control','id'=>'datecreated']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#datecreated').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush