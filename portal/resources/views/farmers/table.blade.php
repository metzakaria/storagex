<div class="table-responsive">
    <table class="table" id="farmers-table">
        <thead>
            <tr>
                <th>Reg Number</th>
        <th>Full Name</th>
        <th>Location</th>
        <th>Email</th>
        <th>Mobile</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($farmers as $farmer)
            <tr>
                <td>{{ $farmer->reg_number }}</td>
            <td>{{ $farmer->full_name }}</td>
            <td>{{ $farmer->location->name }}</td>
            <td>{{ $farmer->email }}</td>
            <td>{{ $farmer->mobile }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['farmers.destroy', $farmer->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('farmers.show', [$farmer->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('farmers.edit', [$farmer->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-edit"></i>
                        </a>
                        @if(Auth::user()->role_id == 1)
                        {!! Form::button('<i class="far fa-trash-alt"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                        @endif
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
