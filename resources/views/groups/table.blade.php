<div class="table-responsive">
    <table class="table" id="groups-table">
        <thead>
            <tr>
                <th>S/N</th>
                <th>Name</th>
        {{-- <th>State Id</th>
        <th>Lga Id</th> --}}
        {{-- <th>Created Menber</th> --}}
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($groups as $key => $group)
            <tr>
                <td>{{$key + 1}}</td>
                <td>{{ $group->name }}</td>
            {{-- <td>{{ $group->state_id }}</td>
            <td>{{ $group->lga_id }}</td> --}}
            {{-- <td>{{ $group->created_menber }}</td> --}}
                <td width="120">
                    {!! Form::open(['route' => ['groups.destroy', $group->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('groups.show', [$group->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('groups.edit', [$group->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-edit"></i>
                        </a>

                        <a href="{{ route('group_members', [$group->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-user"></i>
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
