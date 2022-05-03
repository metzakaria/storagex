<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>
<!-- Invest Type Field -->
<div class="form-group col-sm-6">
    {!! Form::label('invest_type', 'Invest Type:') !!}
    {!! Form::select('invest_type', ['Fixed'=>'Fixed Income'],null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Description Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('description', 'Description:') !!}
    {!! Form::textarea('description', null, ['class' => 'form-control']) !!}
</div>



<!-- Unit Interest Field -->
<div class="form-group col-sm-6">
    {!! Form::label('unit_interest', 'Unit Interest:') !!}
    {!! Form::number('unit_interest', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>

<!-- Unit Amount Field -->
<div class="form-group col-sm-6">
    {!! Form::label('unit_amount', 'Unit Amount:') !!}
    {!! Form::number('unit_amount', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Quantity Field -->
<div class="form-group col-sm-6">
    {!! Form::label('quantity', 'Quantity:') !!}
    {!! Form::number('quantity', null, ['class' => 'form-control','maxlength' => 10,'maxlength' => 10]) !!}
</div>


<!-- Location Field -->
<div class="form-group col-sm-6">
    @php 
        $location = DB::table('locations')->get()->pluck('name','id')->prepend('Select a location', '');
    @endphp
    {!! Form::label('location', 'Location:') !!}
    {!! Form::select('location', $location, null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
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

<!-- Mature Date Field -->
<div class="form-group col-sm-6">
    {!! Form::label('mature_date', 'Mature Date:') !!}
    {!! Form::text('mature_date', null, ['class' => 'form-control','id'=>'mature_date']) !!}
</div>

@push('page_scripts')
    <script type="text/javascript">
        $('#mature_date').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush


<!-- Insurance Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('insurance', 'Insurance:') !!}
    {!! Form::text('insurance', null, ['class' => 'form-control']) !!}
</div>




<!-- Provided By Field -->
<div class="form-group col-sm-6">
    {!! Form::label('provided_by', 'Provided By:') !!}
    {!! Form::text('provided_by', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>


<!-- Is Auctionable Field -->
<div class="form-group col-sm-6">
    <div class="form-check">
        {!! Form::hidden('is_auctionable', 0, ['class' => 'form-check-input']) !!}
        {!! Form::checkbox('is_auctionable', '1', null, ['class' => 'form-check-input']) !!}
        {!! Form::label('is_auctionable', 'Is Auctionable?', ['class' => 'form-check-label']) !!}
    </div>
</div>
<!-- Image File Field -->
<div class="form-group col-sm-6">
    {!! Form::label('image_file', 'Image File:') !!}
    {!! Form::file('image_file', null, ['class' => 'form-control','maxlength' => 255,'maxlength' => 255]) !!}
</div>
