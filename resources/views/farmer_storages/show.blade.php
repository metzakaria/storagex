@extends('layouts.app')

@section('content')
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                   <!-- <h1>Farmer Storage Details</h1>-->
                </div>
                <div class="col-sm-6">
                <a class="btn btn-danger float-right"
                       href="#"  onClick="printDiv()">
                        Print
                    </a>
                    &nbsp; &nbsp; 
                    <a class="btn btn-default float-right"
                       href="{{ route('farmerStorages.index') }}">
                        Back
                    </a> 
                    
                    
                </div>
            </div>
        </div>
    </section>

    <div class="content px-3">
        <div class="card">

            <div class="card-body">
                <div class="row">
                <div id="divPrinting">
                    @include('farmer_storages.show_fields')
                 </div>
                </div>
            </div>

        </div>
    </div>

<script type="text/javascript">
    function printDiv()
    {
        var prtContent = document.getElementById("divPrinting");
        var WinPrint = window.open();
        WinPrint.document.write(prtContent.innerHTML);
        WinPrint.document.close();
        WinPrint.focus();
        WinPrint.print();
        //WinPrint.close();
    }
</script>

@endsection

