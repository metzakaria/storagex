<div class="col-lg-12 detail-view">

    {{-- Stock Item Name --}}

    <div class="col-sm-12">
        {!! Form::label('item_name', 'Stock Item Name:') !!}
        <p>{{ $stockitem->item_name }}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('quantity', 'Quantity:') !!}
        <p>{{ $stockitem->quantity }}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('unit', 'Unit(s):') !!}
        <p>{{ $stockitem->unit }}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('price_per_unit', 'Price Per Unit:') !!}
        <p>{{ $stockitem->price_per_unit }}</p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('in_stock', 'In Stock:') !!}
        <p>@if($stockitem->in_stock == 1) Yes @else No @endif </p>
    </div>

    <div class="col-sm-12">
        {!! Form::label('description', 'Item Description')  !!}
        <p>{{$stockitem->description}} </p>
    </div>

    <div class="col-sm-12">
        @php
            $img = ($stockitem->item_image) ? $stockitem->item_image : 'no_pix.jpg';
        @endphp
        <img src="{{ asset('storage/images/stock_items/'.$img) }}" width="800" height="150" />
    </div>

</div>
