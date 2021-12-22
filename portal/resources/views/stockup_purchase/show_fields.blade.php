<div class="col-lg-12 detail-view">
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

    <div class="col-sm-12">
        {!! Form::label('full_name', 'Member Fullname:') !!}
        <p>{{ getMemberName($stock_purchase->member_id) }}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('stock_name', 'Stock Item:') !!}
        <p>{{ getStockName($stock_purchase->stockup_item_id) }}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('quantity_of_purchase', 'Quantity Purchased:') !!}
        <p>{{ $stock_purchase->quantity_of_purchase}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('cost_per_unit', 'Unit Cost:') !!}
        <p>{{ $stock_purchase->cost_per_unit}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('total_cost', 'Total Cost:') !!}
        <p>{{ $stock_purchase->total_cost}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('delivery_phone_number', 'Delivery Phone Number:') !!}
        <p>{{ $stock_purchase->delivery_phone_number}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('delivery_phone_number', 'Delivery Phone Number:') !!}
        <p>{{ $stock_purchase->delivery_phone_number}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('delivery_address', 'Delivery Address:') !!}
        <p>{{ $stock_purchase->delivery_address}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('delivery_contact_person', 'Delivery Contact Person:') !!}
        <p>{{ $stock_purchase->delivery_contact_person}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('is_paid', 'Is Paid ?:') !!}
        <p>@if($stock_purchase->is_paid == 1) Yes @else No @endif</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('date_paid', 'Date Paid:') !!}
        <p>{{ $stock_purchase->date_paid}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('is_delivered', 'Is Delivered ?:') !!}
        <p>@if($stock_purchase->is_delivered == 1) Yes @else No @endif</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('date_delivered', 'Date Delivered:') !!}
        <p>{{ $stock_purchase->date_delivered}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('expect_delivery_date', 'Expect Delivery Date:') !!}
        <p>{{ $stock_purchase->expect_delivery_date}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('expect_delivery_time', 'Expect Delivery Time:') !!}
        <p>{{ $stock_purchase->expect_delivery_time}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('delivery_note', ' Delivery Note:') !!}
        <p>{{ $stock_purchase->delivery_note}}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('shipping_fee', ' Shipping Fee:') !!}
        <p>{{ $stock_purchase->shipping_fee}}</p>
    </div>

</div>
