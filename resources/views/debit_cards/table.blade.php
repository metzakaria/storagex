<div class="table-responsive">
    <table class="table" id="debitCards-table">
        <thead>
            <tr>
                <th>Member Id</th>
        <th>Card No</th>
        <th>Expire</th>
        <th>Issuing Bank</th>
        <th>Card Type</th>
        <th>Datecreated</th>
            </tr>
        </thead>
        <tbody>
        @foreach($debitCards as $debitCard)
            <tr>
                <td>{{ $debitCard->member->full_name }}</td>
            <td>{{ $debitCard->card_no }}</td>
            <td>{{ $debitCard->expire }}</td>
            <td>{{ $debitCard->issuingbank->bank_name }}</td>
            <td>{{ $debitCard->card_type }}</td>
            <td>{{ $debitCard->datecreated }}</td>
               
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
