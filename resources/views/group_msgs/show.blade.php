@extends('layouts.app')

@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Group Msg Details</h1>
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

    <div class="content px-3">
        <div class="card">

            <div class="card-body">
                <div class="row">
                    @include('group_msgs.show_fields')
                </div>
            </div>

        </div>
        <hr>

        <div class="card">
            <div class="card-header">
                <h5> Message  Replies</h5>
            </div>
            <div class="card-body">
                @php
                    function getMemberFullname($memberID){
                        return DB::table('members')->where('id', $memberID)->value('full_name');
                    }

                    $replies = DB::table('group_msg_replies')->where('group_msg_id', $groupMsg->id)->get();
                @endphp
                <table class="table">
                    <thead>
                        <tr>
                            <th>Message</th>
                            <th>Member Name</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($replies as $reply)
                        <tr>
                            <td>
                                 {{ $reply->replied_message }}
                            </td>
                            <td>{{ getMemberFullname( $reply->replied_member )}}</td>
                            <td> {{\Carbon\Carbon::parse($reply->created_at)->format('d/m/Y') }}</td>

                        </tr>
                        @endforeach

                    </tbody>
                </table>



            </div>
        </div>
    </div>
@endsection
