<div class="table-responsive">
    <table class="table" id="billPayments-table">
        <thead>
            <tr>
                <th>Member Id</th>
        <th>Bill Type</th>
        <th>Amount</th>
        <th>Fee</th>
        <th>Receiver Account</th>
        <th>Description</th>
        <th>Is Paid</th>
        <th>Date Paid</th>
        <th>Date Created</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($billPayments as $billPayment)
            <tr>
                <td>{{ $billPayment->member_id }}</td>
            <td>{{ $billPayment->bill_type }}</td>
            <td>{{ $billPayment->amount }}</td>
            <td>{{ $billPayment->fee }}</td>
            <td>{{ $billPayment->receiver_account }}</td>
            <td>{{ $billPayment->description }}</td>
            <td>{{ $billPayment->is_paid }}</td>
            <td>{{ $billPayment->date_paid }}</td>
            <td>{{ $billPayment->date_created }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['billPayments.destroy', $billPayment->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('billPayments.show', [$billPayment->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                        <a href="{{ route('billPayments.edit', [$billPayment->id]) }}" class='btn btn-default btn-xs'>
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
