<div class="table-responsive">
    <table class="table" id="investments-table">
        <thead>
            <tr>
        <th>Product</th>
        <th>Member</th>
        <th>Qty Bought</th>
        <th>Unit Amount</th>
        <th>Date Invest</th>
        <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @if(!empty($investments))
        @foreach($investments as $investment)
            <tr>
            <td>{{ @$investment->investmentproduct->name }}</td>
            <td>{{ @$investment->member->full_name }}</td>
            <td>{{ $investment->qty_bought }}</td>
            <td>N{{ @number_format($investment->investmentproduct->unit_amount) }}</td>
            <td>{{ $investment->date_invest }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['investments.destroy', $investment->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('investments.show', [$investment->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>

                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        @else
            <tr>
                <td>{{ "No Record Found!!"}}</td>
            </tr>
        @endif
        </tbody>
    </table>
</div>
