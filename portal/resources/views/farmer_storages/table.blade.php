<div class="table-responsive">
    <table class="table" id="farmerStorages-table">
        <thead>
            <tr>
        <th>Receipt</th>
        <th>Farmer</th>
        <th>Warehouse</th>
        <th>Qty</th>
        <th>Amount</th>
        <th>Date</th>
        <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($farmerStorages as $farmerStorage)
            <tr>
            <td>{{ $farmerStorage->receipt }}</td>
            <td>{{ @$farmerStorage->farmer->full_name }}</td>
            <td>{{ @$farmerStorage->warehouse->name }}</td>
            <td>{{ $farmerStorage->qty }}</td>
            <td>N{{ number_format($farmerStorage->value_amount,2) }}</td>

            <td>{{ $farmerStorage->date_receipt_generated }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['farmerStorages.destroy', $farmerStorage->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('farmerStorages.show', [$farmerStorage->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('farmerStorages.edit', [$farmerStorage->id]) }}" class='btn btn-default btn-xs'>
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
