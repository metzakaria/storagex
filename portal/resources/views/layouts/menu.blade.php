@if(Auth::user()->role_id == 1 || Auth::user()->role_id == 2 || Auth::user()->role_id == 3 || Auth::user()->role_id == 4 || Auth::user()->role_id == 5 || Auth::user()->role_id == 6)
<li class="nav-item">
    <a href="{{ route('home') }}"
       class="nav-link {{ Request::is('home*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-tachometer-alt"></i>
        <p>Dashboard</p>
    </a>
</li>
@endif

@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="#" class="nav-link" id="2">
        <i class="nav-icon fas fa-chart-pie"></i>
        <p>
        Members
        <i class="right fas fa-angle-left"></i>
        </p>
    </a>
    <ul class="nav nav-treeview" style="display: none;">
        <li class="nav-item">
            <a href="{{ route('members.index') }}"
            class="nav-link {{ Request::is('members*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Members</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="{{ route('membershipFees.index') }}"
            class="nav-link {{ Request::is('membershipFees*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Membership Fees</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="{{ route('referrals.index') }}"
            class="nav-link {{ Request::is('referrals*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Referrals</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="{{ route('debitCards.index') }}"
            class="nav-link {{ Request::is('debitCards*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Debit Cards</p>
            </a>
        </li>
    </ul>
</li>
@endif


<li class="nav-item">

    <a href="#" class="nav-link">
        <i class="nav-icon fas fa-chart-pie"></i>
        <p>
        Farm
        <i class="right fas fa-angle-left"></i>
        </p>
    </a>
    <ul class="nav nav-treeview" style="display: none;">
        @if(Auth::user()->role_id == 1 || Auth::user()->role_id == 4)
        <li class="nav-item">
            <a href="{{ route('farmers.index') }}"
            class="nav-link {{ Request::is('farmers*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Farmers</p>
            </a>
        </li>
        @endif

        @if(Auth::user()->role_id == 1 )
        <li class="nav-item">
            <a href="{{ route('commodities.index') }}"
            class="nav-link {{ Request::is('commodities*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Commodities</p>
            </a>
        </li>
        @endif

        @if(Auth::user()->role_id == 1 || Auth::user()->role_id == 5)
        <li class="nav-item">
            <a href="{{ route('warehouses.index') }}"
            class="nav-link {{ Request::is('warehouses*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Warehouses</p>
            </a>
        </li>
        @endif
        @if(Auth::user()->role_id == 1 || Auth::user()->role_id == 5)
        <li class="nav-item">
            <a href="{{ route('farmerStorages.index') }}"
            class="nav-link {{ Request::is('farmerStorages*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Warehouse Receipt</p>
            </a>
        </li>
        @endif
    </ul>
</li>

@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="{{ route('partners.index') }}"
       class="nav-link {{ Request::is('partners*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-th"></i>
        <p>Partners</p>
    </a>
</li>
@endif

@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="#" class="nav-link">
        <i class="nav-icon fas fa-chart-pie"></i>
        <p>
        Savings
        <i class="right fas fa-angle-left"></i>
        </p>
    </a>
    <ul class="nav nav-treeview" style="display: none;">
        <li class="nav-item">
            <a href="{{ route('regularSavings.index') }}"
            class="nav-link {{ Request::is('regularSavings*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Regular Savings</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="{{ route('targetSavings.index') }}"
            class="nav-link {{ Request::is('targetSavings*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Target Savings</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="{{ route('regularSavingsTransactions.index') }}"
            class="nav-link {{ Request::is('regularSavingsTransactions*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Regular Savings Transactions</p>
            </a>
        </li>
    </ul>
</li>
@endif

@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="#" class="nav-link">
        <i class="nav-icon fas fa-chart-pie"></i>
        <p>
         Investments
        <i class="right fas fa-angle-left"></i>
        </p>
    </a>
    <ul class="nav nav-treeview" style="display: none;">
        <li class="nav-item">
            <a href="{{ route('investmentProducts.index') }}"
            class="nav-link {{ Request::is('investmentProducts*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p> Products</p>
            </a>
        </li>
        <li class="nav-item">
            <a href="{{ route('investments.index') }}"
            class="nav-link {{ Request::is('investments*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p>Investments</p>
            </a>
        </li>

        <li class="nav-item">
            <a href="{{ route('investmentAuctions.index') }}"
            class="nav-link {{ Request::is('investmentAuctions*') ? 'active' : '' }}">
            <i class="far fa-circle nav-icon"></i>
                <p> Auctions</p>
            </a>
        </li>



    </ul>
</li>
@endif


@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="#" class="nav-link">
        <i class="nav-icon fas fa-chart-pie"></i>
        <p>
         Community
        <i class="right fas fa-angle-left"></i>
        </p>
    </a>
    <ul class="nav nav-treeview" style="display: none;">
    <li class="nav-item">
    <a href="{{ route('groupMembers.index') }}"
        class="nav-link {{ Request::is('groupMembers*') ? 'active' : '' }}">
        <i class="far fa-circle nav-icon"></i>
            <p>Group Members</p>
        </a>
    </li>


    <li class="nav-item">
        <a href="{{ route('groupMsgReplies.index') }}"
        class="nav-link {{ Request::is('groupMsgReplies*') ? 'active' : '' }}">
        <i class="far fa-circle nav-icon"></i>
            <p>Group Msg Replies</p>
        </a>
    </li>


    <li class="nav-item">
        <a href="{{ route('groupMsgs.index') }}"
        class="nav-link {{ Request::is('groupMsgs*') ? 'active' : '' }}">
        <i class="far fa-circle nav-icon"></i>
            <p>Group Msgs</p>
        </a>
    </li>


    <li class="nav-item">
        <a href="{{ route('groups.index') }}"
        class="nav-link {{ Request::is('groups*') ? 'active' : '' }}">
        <i class="far fa-circle nav-icon"></i>
            <p>Groups</p>
        </a>
    </li>
    </ul>
</li>
@endif

@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="{{ route('stockup.index') }}"
       class="nav-link {{ Request::is('stockup*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-th"></i>
        <p>Stock Up</p>
    </a>
</li>
@endif

@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="{{ route('billPayments.index') }}"
       class="nav-link {{ Request::is('billPayments*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-th"></i>
        <p>Bill Payments</p>
    </a>
</li>
@endif

@if(Auth::user()->role_id == 1)
<li class="nav-item">
    <a href="{{ route('users.index') }}"
       class="nav-link {{ Request::is('users*') ? 'active' : '' }}">
       <i class="nav-icon fas fa-th"></i>
        <p>Users</p>
    </a>
</li>
@endif


@push('page_scripts')

    <script type="text/javascript">

    </script>

@endpush
