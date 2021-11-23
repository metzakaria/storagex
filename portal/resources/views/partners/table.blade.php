<div class="table-responsive">
    <table class="table" id="partners-table">
        <thead>
            <tr>
                <th>Partner Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Asset Type</th>
        <th>Insurance</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($partners as $partner)
            <tr>
                <td>{{ $partner->partner_name }}</td>
            <td>{{ $partner->email }}</td>
            <td>{{ $partner->phone }}</td>
            <td>{{ $partner->assettype->name }}</td>
            <td>{{ $partner->insurance }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['partners.destroy', $partner->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('partners.show', [$partner->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('partners.edit', [$partner->id]) }}" class='btn btn-default btn-xs'>
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
