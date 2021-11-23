<div class="table-responsive">
    <table class="table" id="membershipFees-table">
        <thead>
            <tr>
                <th>Member Id</th>
        <th>Amount</th>
        <th>Start Date</th>
        <th>End Date</th>
        <th>Date Created</th>
        <th>Status </th>
            </tr>
        </thead>
        <tbody>
        @foreach($membershipFees as $membershipFee)
            <tr>
                <td>{{ $membershipFee->member->full_name }}</td>
            <td>{{ $membershipFee->amount }}</td>
            <td>{{ $membershipFee->start_date }}</td>
            <td>{{ $membershipFee->end_date }}</td>
            <td>{{ $membershipFee->date_created }}</td>
            <td>Active</td>
            
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
