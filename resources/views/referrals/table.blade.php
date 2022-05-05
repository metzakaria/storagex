<div class="table-responsive">
    <table class="table" id="referrals-table">
        <thead>
            <tr>
                <th>Member</th>
        <th>Referred By</th>
        <th>Commission</th>
        <th>Date Created</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($referrals as $referral)
            <tr>
                <td>{{ $referral->member->full_name }}</td>
            <td>{{ $referral->referredmember->full_name }}</td>
            <td>N{{ number_format($referral->commission,2) }}</td>
            <td>{{ $referral->date_created }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['referrals.destroy', $referral->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('referrals.show', [$referral->id]) }}" class='btn btn-default btn-xs'>
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
