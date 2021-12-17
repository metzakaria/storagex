@extends('layouts.app')

@section('content')

<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Stock Up Purchase</h1>
            </div>

        </div>
    </div>

</section>

<div class="content">

    @include('flash::message')

    <div class="clearfix"></div>

    <div class="card">

        <div class="card-body p-0">
            @include('stockup_purchase.table')
        </div>

        <div class="card-footer clearfix float-right">
            <div class="float-right">
                @include('adminlte-templates::common.paginate', ['records' => $stock_purchase])
            </div>
        </div>
    </div>


</div>

@endsection
