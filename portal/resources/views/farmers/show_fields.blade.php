<div class="col-lg-9 detail-view">
<!-- Reg Number Field -->
<div class="col-sm-12">
    {!! Form::label('reg_number', 'Reg Number:') !!}
    <p>{{ $farmer->reg_number }}</p>
</div>

<!-- Full Name Field -->
<div class="col-sm-12">
    {!! Form::label('full_name', 'Full Name:') !!}
    <p>{{ $farmer->full_name }}</p>
</div>



<!-- Location Id Field -->
<div class="col-sm-12">
    {!! Form::label('location_id', 'Location:') !!}
    <p>{{ $farmer->location->name }}</p>
</div>

<!-- Photo Field -->
<div class="col-sm-12">
    {!! Form::label('photo', 'Photo:') !!}
    <p>{{ $farmer->photo }}</p>
</div>

<!-- Email Field -->
<div class="col-sm-12">
    {!! Form::label('email', 'Email:') !!}
    <p>{{ $farmer->email }}</p>
</div>

<!-- Mobile Field -->
<div class="col-sm-12">
    {!! Form::label('mobile', 'Mobile:') !!}
    <p>{{ $farmer->mobile }}</p>
</div>

<!-- Address Field -->
<div class="col-sm-12">
    {!! Form::label('address', 'Address:') !!}
    <p>{{ $farmer->address }}</p>
</div>

<!-- Produce Description Field -->
<div class="col-sm-12">
    {!! Form::label('produce_description', 'Produce Description:') !!}
    <p>{{ $farmer->produce_description }}</p>
</div>

<!-- Created By Field -->
<div class="col-sm-12">
    {!! Form::label('created_by', 'Created By:') !!}
    <p>{{ $farmer->created_by }}</p>
</div>

</div>
<div class="col-sm-3 text-center">
    <h5>Photo</h5>
    @php $img = ($farmer->photo)?$farmer->photo:'no_pix.jpg'; @endphp 
    <img src="{{ asset('storage/images/farmers/'.$img) }}" width="150" height="150" />
    
</div>
