<div class="table-responsive">
    <table class="table" id="groupMembers-table">
        <thead>
            <tr>
                <th>Group Id</th>
        <th>Member Id</th>
        <th>Group Owner Id</th>
        <th>Date Created</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($groupMembers as $groupMember)
            <tr>
                <td>{{ $groupMember->group_id }}</td>
            <td>{{ $groupMember->member_id }}</td>
            <td>{{ $groupMember->group_owner_id }}</td>
            <td>{{ $groupMember->date_created }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['groupMembers.destroy', $groupMember->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('groupMembers.show', [$groupMember->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('groupMembers.edit', [$groupMember->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-edit"></i>
                        </a>
                        {!! Form::button('<i class="far fa-trash-alt"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
