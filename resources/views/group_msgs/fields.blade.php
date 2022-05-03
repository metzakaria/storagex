<!-- Group Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('group_id', 'Group Id:') !!}
    {!! Form::number('group_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Message Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('message', 'Message:') !!}
    {!! Form::textarea('message', null, ['class' => 'form-control']) !!}
</div>

<!-- Created Menber Field -->
<div class="form-group col-sm-6">
    {!! Form::label('created_menber', 'Created Menber:') !!}
    {!! Form::number('created_menber', null, ['class' => 'form-control']) !!}
</div>