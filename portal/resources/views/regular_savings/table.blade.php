<div class="table-responsive">
    <table class="table" id="regularSavings-table">
        <thead>
            <tr>
                <th>Member Id</th>
        <th>Amount</th>
        <th>Frequency</th>
        <th>Default Payment</th>
        <th>Autosave</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($regularSavings as $regularSaving)
            <tr>
                <td>{{ @$regularSaving->member->full_name }}</td>
            <td>N{{ number_format($regularSaving->amount) }}</td>
            <td>{{ $regularSaving->frequency }}</td>
            <td>{{ $regularSaving->default_payment_method }}</td>
            <td>{{ ($regularSaving->autosave==1)?'YES':'NO' }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['regularSavings.destroy', $regularSaving->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('regularSavings.show', [$regularSaving->id]) }}" class='btn btn-default btn-xs'>
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
