<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>

<!-- Category Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('category_id', 'Category Id:') !!}
    {!! Form::number('category_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Description Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('description', 'Description:') !!}
    {!! Form::textarea('description', null, ['class' => 'form-control']) !!}
</div>

<!-- Target Amt Field -->
<div class="form-group col-sm-6">
    {!! Form::label('target_amt', 'Target Amt:') !!}
    {!! Form::text('target_amt', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Cur Amt Field -->
<div class="form-group col-sm-6">
    {!! Form::label('cur_amt', 'Cur Amt:') !!}
    {!! Form::text('cur_amt', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Prev Amt Field -->
<div class="form-group col-sm-6">
    {!! Form::label('prev_amt', 'Prev Amt:') !!}
    {!! Form::text('prev_amt', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Yearly Interest Field -->
<div class="form-group col-sm-6">
    {!! Form::label('yearly_interest', 'Yearly Interest:') !!}
    {!! Form::text('yearly_interest', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Start Date Field -->
<div class="form-group col-sm-6">
    {!! Form::label('start_date', 'Start Date:') !!}
    {!! Form::text('start_date', null, ['class' => 'form-control','id'=>'start_date']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#start_date').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::number('member_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Is Current Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_current', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_current', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_current', 'Is Current', ['class' => 'form-check-label']) !!}
    </div>
</div>
