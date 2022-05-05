<div class="table-responsive">
    <table class="table" id="commodities-table">
        <thead>
            <tr>
                <th>Code</th>
        <th>Name</th>
        <th>Unit Measure</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($commodities as $commodity)
            <tr>
                <td>{{ $commodity->code }}</td>
            <td>{{ $commodity->name }}</td>
            <td>{{ $commodity->unit_measure }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['commodities.destroy', $commodity->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('commodities.edit', [$commodity->id]) }}" class='btn btn-default btn-xs'>
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
