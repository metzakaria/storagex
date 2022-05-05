<div class="table-responsive">
    <table class="table" id="regularSavingsTransactions-table">
        <thead>
            <tr>
        <th>Transaction Ref</th>
        <th>Description</th>
        <th>Amount</th>
        <th>Type</th>
        <th>Member</th>
        <th>Date Transaction</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($regularSavingsTransactions as $regularSavingsTransaction)
            <tr>
                <td>{{ $regularSavingsTransaction->transaction_ref }}</td>
            <td>{{ $regularSavingsTransaction->description }}</td>
            <td>N{{ number_format($regularSavingsTransaction->amount,2) }}</td>
            <td>{{ $regularSavingsTransaction->dr_cr }}</td>
            <td>{{ @$regularSavingsTransaction->member->full_name }}</td>
            <td>{{ $regularSavingsTransaction->date_transaction }}</td>
            
                <td width="120">
                    {!! Form::open(['route' => ['regularSavingsTransactions.destroy', $regularSavingsTransaction->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('regularSavingsTransactions.show', [$regularSavingsTransaction->id]) }}" class='btn btn-default btn-xs'>
                            <i class="far fa-eye"></i>
                        </a>
                     
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
