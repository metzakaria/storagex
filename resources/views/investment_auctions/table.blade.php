<div class="table-responsive">
    <table class="table" id="investmentAuctions-table">
        <thead>
            <tr>
        <th>Invest Product</th>
        <th>Qty Offer</th>
        <th>Total Amount</th>
        <th>Boughtby</th>
        <th>Date Created</th>
        <th>Offer Close At</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($investmentAuctions as $investmentAuction)
            <tr>
            <td>{{ $investmentAuction->investment_product->name }}</td>
            <td>{{ $investmentAuction->qty_offer }}</td>
            <td>N{{ number_format($investmentAuction->total_amount) }}</td>
            <td>{{ $investmentAuction->boughtbymember->full_name }}</td>
            <td>{{ $investmentAuction->date_created }}</td>
            <td>{{ $investmentAuction->offer_close_at }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['investmentAuctions.destroy', $investmentAuction->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('investmentAuctions.show', [$investmentAuction->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                       
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
