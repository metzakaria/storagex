<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::number('member_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Referred Member Field -->
<div class="form-group col-sm-6">
    {!! Form::label('referred_member', 'Referred Member:') !!}
    {!! Form::number('referred_member', null, ['class' => 'form-control']) !!}
</div>

<!-- Commission Field -->
<div class="form-group col-sm-6">
    {!! Form::label('commission', 'Commission:') !!}
    {!! Form::text('commission', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
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