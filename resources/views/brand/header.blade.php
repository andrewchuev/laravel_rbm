@push('head')
    <meta name="robots" content="noindex"/>
    <link href="{{ asset('/storage/images/removebg-logo.png') }}" sizes="any" type="image/svg+xml" id="favicon" rel="icon">

    <!-- For Safari on iOS -->
    <meta name="theme-color" content="#21252a">
@endpush

<div class="h2 fw-light d-flex align-items-center justify-content-center">
    @guest
        <img class="img-fluid w-50" src="/storage/images/removebg-logo.png" alt="logo">
    @else
        <img class="img-fluid" src="/storage/images/removebg-logo.png" alt="logo">
    @endguest
</div>
