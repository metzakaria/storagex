@php 
    $banks = DB::table('banks')->get()->pluck('bank_name','id')->prepend('Select a bank', '');
    $idtypes = DB::table('identity_types')->get()->pluck('identity_name','id')->prepend('Select a ID Type', '');
@endphp
<div class="table-responsive">
    <table class="table" id="warehouses-table">
        <thead>
            <tr>
                <th>Name</th>
        <th>Location</th>
        <th>Insurance</th>
        <th>Policy Number</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($warehouses as $warehouse)
            <tr>
                <td>{{ $warehouse->name }}</td>
            <td>{{ @$warehouse->location->name }}</td>
            <td>{{ $warehouse->insurance }}</td>
            <td>{{ $warehouse->policy_number }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['warehouses.destroy', $warehouse->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('warehouses.show', [$warehouse->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('warehouses.edit', [$warehouse->id]) }}" class='btn btn-default btn-xs'>
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
