@extends('layouts.app')


@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Stock Up</h1>
                </div>
                <div class="col-sm-6">
                    <a class="btn btn-primary float-right"
                       href="{{ route('stockup.create') }}">
                        Add Stock Item
                    </a>
                </div>
            </div>
        </div>

    </section>

    <div class="content">

        @include('flash::message')

        <div class="clearfix"></div>

        <div class="card">

            <div class="card-body p-0">
                @include('stockup.table')
            </div>

            <div class="card-footer clearfix float-right">
                <div class="float-right">
                    @include('adminlte-templates::common.paginate', ['records' => $stocks])
                </div>
            </div>
        </div>


    </div>


@endsection
