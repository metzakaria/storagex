@php
    function getMemberName($memberID){
        $member = DB::table('members')->where('id', $memberID)->first();
        return $member->full_name;
    }

    function getStockName($stockID){
        $stock = DB::table('stockup_items')->where('id', $stockID)->first();
        return $stock->item_name;
    }
@endphp

<div class="table-responsive">
    <table class="table" id="stock-table">
        <thead>
            <tr>
                <th>S/N</th>
                <th>Member(s) name</th>
                <th>Stock name</th>
                <th>Quantity purchased</th>
                <th>Total cost </th>
                <th>Delivery Phone Number? </th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
            @foreach($stock_purchase as $key=>$value)
                <tr>
                    <td>{{$key + 1}}</td>
                    <td>{{getMemberName($value['member_id'])}}</td>
                    <td>{{getStockName($value['stockup_item_id'])}}</td>
                    <td>{{$value['quantity_of_purchase']}}</td>
                    <td id="total_cost">N {{ $value['total_cost'] }}</td>
                    <td>{{$value['delivery_phone_number']}} </td>
                    <td>

                        <div class='btn-group'>
                            <a href="{{ route('stockupPurchases.show', [$value['id']]) }}" class='btn btn-default btn-xs'>
                                <i class="far fa-eye"></i>
                            </a>
                        </div>

                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
