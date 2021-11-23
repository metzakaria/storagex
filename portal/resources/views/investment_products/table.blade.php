<div class="table-responsive">
    <table class="table" id="investmentProducts-table">
        <thead>
            <tr>
                <th>Name</th>
        <th>Unit Amount</th>
        <th>Quantity</th>
        <th>Qty Sold</th>
        <th>Start Date</th>
        <th>Mature Date</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($investmentProducts as $investmentProduct)
            <tr>
                <td>{{ $investmentProduct->name }}</td>
            <td>N{{ number_format($investmentProduct->unit_amount,2) }}</td>
            <td>{{ $investmentProduct->quantity }}</td>
            <td>{{ $investmentProduct->qty_sold }}</td>
            <td>{{ $investmentProduct->start_date->format('d/m/Y') }}</td>
            <td>{{ $investmentProduct->mature_date->format('d/m/Y') }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['investmentProducts.destroy', $investmentProduct->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('investmentProducts.show', [$investmentProduct->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('investmentProducts.edit', [$investmentProduct->id]) }}" class='btn btn-default btn-xs'>
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
