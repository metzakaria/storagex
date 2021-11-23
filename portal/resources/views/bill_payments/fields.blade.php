<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::number('member_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Bill Type Field -->
<div class="form-group col-sm-6">
    {!! Form::label('bill_type', 'Bill Type:') !!}
    {!! Form::text('bill_type', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('amount', 'Amount:') !!}
    {!! Form::text('amount', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Fee Field -->
<div class="form-group col-sm-6">
    {!! Form::label('fee', 'Fee:') !!}
    {!! Form::text('fee', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Receiver Account Field -->
<div class="form-group col-sm-6">
    {!! Form::label('receiver_account', 'Receiver Account:') !!}
    {!! Form::text('receiver_account', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Description Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('description', 'Description:') !!}
    {!! Form::textarea('description', null, ['class' => 'form-control']) !!}
</div>

<!-- Is Paid Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_paid', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_paid', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_paid', 'Is Paid', ['class' => 'form-check-label']) !!}
    </div>
</div>


<!-- Date Paid Field -->
<div class="form-group col-sm-6">
    {!! Form::label('date_paid', 'Date Paid:') !!}
    {!! Form::text('date_paid', null, ['class' => 'form-control','id'=>'date_paid']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#date_paid').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Date Created Field -->
<div class="form-group col-sm-6">
    {!! Form::label('date_created', 'Date Created:') !!}
    {!! Form::text('date_created', null, ['class' => 'form-control','id'=>'date_created']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#date_created').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush