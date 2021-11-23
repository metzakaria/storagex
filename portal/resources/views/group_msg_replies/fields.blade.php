<!-- Group Msg Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('group_msg_id', 'Group Msg Id:') !!}
    {!! Form::number('group_msg_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Replied Message Field -->
<div class="form-group col-sm-12 col-lg-12">
    {!! Form::label('replied_message', 'Replied Message:') !!}
    {!! Form::textarea('replied_message', null, ['class' => 'form-control']) !!}
</div>

<!-- Replied Member Field -->
<div class="form-group col-sm-6">
    {!! Form::label('replied_member', 'Replied Member:') !!}
    {!! Form::number('replied_member', null, ['class' => 'form-control']) !!}
</div>