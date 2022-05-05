<div class="table-responsive">
    <table class="table" id="targetSavings-table">
        <thead>
            <tr>
        <th>Name</th>
        <th>Category</th>
        <th>Target Amount</th>
        <th>Start Date</th>
        <th>Member</th>
        <th>Completed</th>
        <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($targetSavings as $targetSaving)
            <tr>
                <td>{{ $targetSaving->name }}</td>
            <td>{{ @$targetSaving->category->cat_name }}</td>
            <td>{{ $targetSaving->target_amt }}</td>
            <td>{{ $targetSaving->start_date }}</td>
            <td>{{ @$targetSaving->member->full_name }}</td>
            <td>{{ ($targetSaving->is_current==0)?'YES':'NO' }}</td>
                <td width="120">
                    {!! Form::open(['route' => ['targetSavings.destroy', $targetSaving->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('targetSavings.show', [$targetSaving->id]) }}" class='btn btn-default btn-xs'>
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
