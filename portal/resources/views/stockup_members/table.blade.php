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
                <th>Members Name</th>
                <th>Stock Name</th>
                <th>Period(month)</th>
                {{-- <th colspan="3">Action</th> --}}
            </tr>
        </thead>
        <tbody>
            @foreach($stock_members as $key=>$value)
                <tr>
                    <td>{{$key + 1}}</td>
                    <td>{{getMemberName($value['member_id'])}}</td>
                    <td>{{getStockName($value['stockup_item_id'])}}</td>
                    <td>{{$value['period']}}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>
