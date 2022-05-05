@php
      function getMemberFullname($memberID){
        return DB::table('members')->where('id', $memberID)->value('full_name');
    }
@endphp
<div class="col-sm-12">
    @foreach($replies as $key => $value)
        <div class="row">
            <div class="col-sm-8">
                <p> {{$value['replied_message']}}</p>
            </div>
            <div class="col-sm-2">{{getMemberFullname($value['replied_member'])}}</div>
            <div class="col-sm-2">{{$value['created_at']}}</div>

        </div>

    @endforeach

</div>
