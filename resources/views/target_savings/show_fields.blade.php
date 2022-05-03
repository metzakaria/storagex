<div class="col-lg-12 detail-view">
<!-- Name Field -->
<div class="col-sm-12">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $targetSaving->name }}</p>
</div>

<!-- Category Id Field -->
<div class="col-sm-12">
    {!! Form::label('category_id', 'Category:') !!}
    <p>{{ $targetSaving->category->cat_name }}</p>
</div>

<!-- Description Field -->
<div class="col-sm-12">
    {!! Form::label('description', 'Description:') !!}
    <p>{{ $targetSaving->description }}</p>
</div>

<!-- Target Amt Field -->
<div class="col-sm-12">
    {!! Form::label('target_amt', 'Target Amt:') !!}
    <p>N{{ number_format($targetSaving->target_amt) }}</p>
</div>

<!-- Cur Amt Field -->
<div class="col-sm-12">
    {!! Form::label('cur_amt', 'Cur Amt:') !!}
    <p>N{{ number_format($targetSaving->cur_amt) }}</p>
</div>

<!-- Prev Amt Field -->
<div class="col-sm-12">
    {!! Form::label('prev_amt', 'Prev Amt:') !!}
    <p>N{{ number_format($targetSaving->prev_amt) }}</p>
</div>

<!-- Yearly Interest Field -->
<div class="col-sm-12">
    {!! Form::label('yearly_interest', 'Yearly Interest:') !!}
    <p>{{ $targetSaving->yearly_interest }}%</p>
</div>

<!-- Start Date Field -->
<div class="col-sm-12">
    {!! Form::label('start_date', 'Start Date:') !!}
    <p>{{ $targetSaving->start_date }}</p>
</div>

<!-- Member Id Field -->
<div class="col-sm-12">
    {!! Form::label('member_id', 'Member:') !!}
    <p>{{ $targetSaving->member->full_name }}</p>
</div>

<!-- Is Current Field -->
<div class="col-sm-12">
    {!! Form::label('is_current', 'Completed:') !!}
    <p>{{ ($targetSaving->is_current==0)?'YES':'NO' }}</p>
</div>

</div>