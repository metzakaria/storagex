
@extends('layouts.app')

@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-12">
                    <h1>Edit Bill Payment</h1>
                </div>
            </div>
        </div>
    </section>

    <div class="content px-3" >

        @include('adminlte-templates::common.errors')

        <div class="card">

            {!! Form::model($billPayment, ['route' => ['billPayments.update', $billPayment->id], 'method' => 'patch']) !!}

            <div class="card-body">
                <div class="row">
                    @include('bill_payments.fields')
                </div>
            </div>

            <div class="card-footer">
                {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
                <a href="{{ route('billPayments.index') }}" class="btn btn-default">Cancel</a>
            </div>

           {!! Form::close() !!}

        </div>
    </div>
@endsection
