

<div class="table-responsive">
        <table class="table" id="stock-table">
            <thead>
                <tr>
                    <th>S/N</th>
                    <th>Item Name</th>
                    <th>Quantity</th>
                    <th>In Stock</th>
                    <th colspan="3">Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($stocks as $key=>$value)
                    <tr>
                        <td>{{$key + 1}}</td>
                        <td>{{$value['item_name']}}</td>
                        <td>{{$value['quantity']}}</td>
                        <td>@if($value['in_stock'] == 1) Yes @else No @endif</td>
                        <td width="120">
                            {!! Form::open(['route' => ['stockup.destroy', $value['id']], 'method' => 'delete']) !!}
                            <div class='btn-group'>
                                <a href="{{ route('stockup.show', [$value['id']]) }}" class='btn btn-default btn-xs'>
                                    <i class="far fa-eye"></i>
                                </a>
                                <a href="{{ route('stockup.edit', [$value['id']]) }}" class='btn btn-default btn-xs'>
                                    <i class="far fa-edit"></i>
                                </a>
                                {!! Form::button('<i class="far fa-trash-alt"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                            </div>
                            {!! Form::close() !!}
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
</div>
