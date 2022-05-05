@php
    function getRoleName($roleid) {
        return DB::table('user_roles')->where('id', $roleid)->value('role');
    }

@endphp

<div class="table-responsive">
    <table class="table" id="users-table">
        <thead>
            <tr>
                <th>Full Name</th>
                <th>Phone</th>
                <th>Email</th>
                {{-- <th>Password</th> --}}
                <th>Role</th>
                <th>Is Active</th>
                <th>Last Login</th>
        {{-- <th>Remember Token</th> --}}
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($users as $users)
            <tr>
                <td>{{ $users->full_name }}</td>
            <td>{{ $users->phone }}</td>
            <td>{{ $users->email }}</td>
            {{-- <td>{{ $users->password }}</td> --}}
            <td>{{ getRoleName($users->role_id) }}</td>
            <td>@if ($users->is_active==1) Yes @else No @endif</td>
            <td>{{ $users->last_login }}</td>
            {{-- <td>{{ $users->remember_token }}</td> --}}
                <td width="120">
                    {!! Form::open(['route' => ['users.destroy', $users->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('users.show', [$users->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('users.edit', [$users->id]) }}" class='btn btn-default btn-xs'>
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
