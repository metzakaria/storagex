<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="{{ route('home') }}" class="brand-link">
<<<<<<< HEAD
        <!--<img src="https://assets.infyom.com/logo/blue_logo_150x150.png"-->
        <!--     alt="{{ config('app.name') }} Logo"-->
        <!--     class="brand-image img-circle elevation-3">-->
=======
        <img src="https://assets.infyom.com/logo/blue_logo_150x150.png"
             alt="{{ config('app.name') }} Logo"
             class="brand-image img-circle elevation-3">
>>>>>>> emmybranch
        <span class="brand-text font-weight-light">{{ config('app.name') }}</span>
    </a>

    <div class="sidebar">
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                @include('layouts.menu')
            </ul>
        </nav>
    </div>

</aside>
<<<<<<< HEAD


@push('page_scripts')

    <script type="text/javascript">
        $(document).ready(function(){
           $('.nav-link').each(function(){
                if($(this).hasClass('active')){
                    $(this).parents('.nav-item').addClass('menu-open').children(':first-child').addClass('active');
                }
            })


        })

    </script>

@endpush
=======
>>>>>>> emmybranch
