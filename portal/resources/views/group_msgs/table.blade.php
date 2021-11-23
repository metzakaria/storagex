<div class="table-responsive">
    <table class="table" id="groupMsgs-table">
        <thead>
            <tr>
                <th>Group Id</th>
        <th>Message</th>
        <th>Created Menber</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($groupMsgs as $groupMsg)
            <tr>
                <td>{{ $groupMsg->group_id }}</td>
            <td>{{ $groupMsg->message }}</td>
            <td>{{ $groupMsg->created_menber }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['groupMsgs.destroy', $groupMsg->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('groupMsgs.show', [$groupMsg->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('groupMsgs.edit', [$groupMsg->id]) }}" class='btn btn-default btn-xs'>
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
