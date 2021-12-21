@extends('layouts.app')

@section('content')

<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Message Replies</h1>
            </div>
            <div class="col-sm-6">
                <a class="btn btn-default float-right"
                   href="{{ route('groupMsgs.index') }}">
                    Back
                </a>
            </div>
        </div>
    </div>
</section>
@php

    $header="";
    foreach($replies as $key=>$value){
        $header = $value['group_msg_id'];
    }
    $Header = DB::table('group_msgs')->where('id', $header)->value('message');

@endphp

<div class="content px-3">
    <div class="card">
        <div class="card-header">
            <h3>
                {{$Header}}
            </h3>
        </div>
        <div class="card-body">
            <div class="row">
                @include('group_msgs.replies.reply')
            </div>
        </div>

    </div>
</div>


@endsection
