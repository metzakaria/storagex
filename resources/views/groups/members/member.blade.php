
@php
    function getGroupName($groupID){
        return DB::table('groups')->where('id', $groupID)->value('name');
    }

    function getMemberFullname($memberID){
        return DB::table('members')->where('id', $memberID)->value('full_name');
    }

@endphp
<div class="table-responsive">
    <table class="table">
        <thead>
            <tr>
                <th>S/N</th>
                <th>Group Name</th>
                <th>Member Fullname</th>
            </tr>
        </thead>
        <tbody>
            @foreach($group_members as $key => $value)
                <tr>
                    <td>{{$key + 1}}</td>
                    <td>{{ getGroupName($value['group_id']) }}</td>
                    <td>{{ getMemberFullname($value['member_id'])}} </td>

                </tr>

            @endforeach
        </tbody>
    </table>
</div>
