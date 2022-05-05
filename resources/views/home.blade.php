@extends('layouts.app')

@section('content')
<div class="container">
<div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
<<<<<<< HEAD

=======
   
>>>>>>> emmybranch
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
<<<<<<< HEAD
                <h3 id="farmer"></h3>
=======
                <h3>150</h3>
>>>>>>> emmybranch

                <p>Farmers </p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
<<<<<<< HEAD
              {{-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> --}}
=======
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
>>>>>>> emmybranch
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
<<<<<<< HEAD
                <h3 id="member"></h3>
=======
                <h3>53<sup style="font-size: 20px">%</sup></h3>
>>>>>>> emmybranch

                <p>Members</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
<<<<<<< HEAD
              {{-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> --}}
=======
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
>>>>>>> emmybranch
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
<<<<<<< HEAD
                <h3 id="receipt"></h3>

                <p>Electronic Receipts</p>
=======
                <h3>44</h3>

                <p>Elec. Receipts</p>
>>>>>>> emmybranch
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
<<<<<<< HEAD
              {{-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> --}}
=======
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
>>>>>>> emmybranch
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
<<<<<<< HEAD
                <h3 id="investor"></h3>
=======
                <h3>65</h3>
>>>>>>> emmybranch

                <p>Investors</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
<<<<<<< HEAD
              {{-- <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a> --}}
=======
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
>>>>>>> emmybranch
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Recent Members</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
<<<<<<< HEAD

=======
                    
>>>>>>> emmybranch
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>User</th>
                      <th>Date</th>
                      <th>Status</th>
<<<<<<< HEAD
                    </tr>
                  </thead>
                  <tbody id="member_table">

=======
                      <th>Reason</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>183</td>
                      <td>John Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-success">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>219</td>
                      <td>Alexander Pierce</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-warning">Pending</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>657</td>
                      <td>Bob Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-primary">Approved</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
                    <tr>
                      <td>175</td>
                      <td>Mike Doe</td>
                      <td>11-7-2014</td>
                      <td><span class="tag tag-danger">Denied</span></td>
                      <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                    </tr>
>>>>>>> emmybranch
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
</div>
@endsection
<<<<<<< HEAD

@push('page_scripts')
    <script type="text/javascript">
        $(document).ready(function() {
            dashboardDataLoading();
        });

        function dashboardDataLoading(){

            let URL = window.location.origin;
            if(URL !== "http://localhost:8000"){
                URL = "https://portal.storagex.com.ng/public/"
            }
 
            fetch(URL+"dashboard/show")
            .then(res=>res.json())
            .then(data=>{
                $('#farmer').html(data.data.farmer);
                $('#member').html(data.data.member);
                $('#investor').html(data.data.investment)
                $('#receipt').html(data.data.receipt);
                let table = ""
                $.each(data.data.member_table, (key, value)=>{
                    console.log(value)
                    table += `
                        <tr>
                            <td>${key + 1}</td>
                            <td>${value.full_name}</td>
                            <td>${value.created_at}</td>
                            <td>${!value.is_verified ? 'Pending':'Approved'}</td>
                        </tr>
                    `

                });
                $('#member_table').append(table);

            }).catch(error=>console.log(error));
        }
    </script>


@endpush
=======
>>>>>>> emmybranch
