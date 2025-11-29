<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>{{ config('app.name') }} - Executive Committee</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="{{ asset('assets/img/favicon.ico') }}" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Space+Grotesk&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="{{ asset('assets/lib/animate/animate.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/lib/owlcarousel/assets/owl.carousel.min.css') }}" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/styles.css') }}" rel="stylesheet">
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid bg-light sticky-top">
        <div class="container">
            <x-navigation />
        </div>
    </div>
    <!-- Navbar End -->

    <div class="container-fluid pb-3 hero-header bg-light">
        <div class="container">
            <div class="glass-card-header mb-3">
                <h5 class="text-center fw-bold"
                    style="color:#045D5D; letter-spacing:1px; text-shadow:1px 2px 8px #fff8; font-size:1.5rem; font-family:'Poppins',sans-serif;">
                    কার্যনির্বাহী কমিটি (Executive Committee)
                </h5>
            </div>
            <div class="row mb-5">

                @foreach ($designations as $designation)
                    @foreach ($designation->committees as $cm)
                        @php $member = $cm->member; @endphp
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="card border-0 shadow-lg h-100">
                                <div class="card-header text-center bg-light">
                                    <strong>{{ $designation->name }}</strong>
                                    @if ($designation->used_option)
                                        <span class="text-muted">({{ $designation->used_option }})</span>
                                    @endif
                                </div>
                                <div class="card-body text-center p-4">
                                    <div class="position-relative mb-4">
                                        <div class="member-avatar mx-auto"
                                            style="width: 120px; height: 120px; border-radius: 50%; overflow: hidden; border: 4px solid #045D5D; background: linear-gradient(135deg, #045D5D, #067676);">
                                            <img src="{{ isset($member->photo) ? asset('uploads/profile/' . $member->photo) : asset('assets/img/team/default.jpg') }}"
                                                class="w-100 h-100" style="object-fit: cover;"
                                                alt="{{ $member->first_name }} {{ $member->last_name }}"
                                                onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                                            <div
                                                class="d-none align-items-center justify-content-center w-100 h-100 text-white">
                                                <i class="fas fa-user fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>

                                    <h5 class="fw-bold text-dark mb-1">{{ $member->first_name }}
                                        {{ $member->last_name }}</h5>
                                    <p class="text-muted small mb-2">{{ $member->first_name_bn }}
                                        {{ $member->last_name_bn }}</p>
                                    <h6 class="text-primary mb-3">{{ $designation->name }}</h6>

                                    <div class="contact-info mb-3">
                                        <p class="mb-1 small">
                                            <i class="fas fa-phone text-success me-2"></i>
                                            <a href="tel:{{ $member->mobile }}"
                                                class="text-decoration-none">{{ $member->mobile }}</a>
                                        </p>
                                        <p class="mb-0 small">
                                            <i class="fas fa-envelope text-primary me-2"></i>
                                            <a href="mailto:{{ $member->email }}"
                                                class="text-decoration-none">{{ $member->email }}</a>
                                        </p>
                                    </div>

                                    <div class="social-links">
                                        @if (isset($member->facebook))
                                            <a href="{{ $member->facebook }}"
                                                class="btn btn-outline-primary btn-sm me-2" target="_blank">
                                                <i class="fab fa-facebook-f"></i>
                                            </a>
                                        @endif
                                        @if (isset($member->linkedin))
                                            <a href="{{ $member->linkedin }}"
                                                class="btn btn-outline-primary btn-sm me-2" target="_blank">
                                                <i class="fab fa-linkedin-in"></i>
                                            </a>
                                        @endif
                                        @if (isset($member->twitter))
                                            <a href="{{ $member->twitter }}"
                                                class="btn btn-outline-primary btn-sm me-2" target="_blank">
                                                <i class="fab fa-twitter"></i>
                                            </a>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endforeach
            </div>

            <!-- Committee Information -->
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="card border-0 shadow-sm">
                                <div class="card-body p-4">
                                    <h5 class="card-title text-center mb-4" style="color: #045D5D;">কমিটির তথ্য</h5>
                                    <div class="row g-4">
                                        <div class="col-md-6">
                                            <h6>কমিটি গঠনের তারিখ:</h6>
                                            <p>{{ $committeeInfo['formation_date'] ? \Carbon\Carbon::parse($committeeInfo['formation_date'])->format('d F Y') : '-' }}</p>

                                            <h6>কার্যকাল:</h6>
                                            <p>{{ $committeeInfo['tenure_years'] ? $committeeInfo['tenure_years'] . ' বছর' : '-' }}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <h6>পরবর্তী নির্বাচন:</h6>
                                            <p>{{ $committeeInfo['next_election_date'] ? \Carbon\Carbon::parse($committeeInfo['next_election_date'])->format('d F Y') : '-' }}</p>

                                            <h6>মোট সদস্য সংখ্যা:</h6>
                                            <p>{{ $committeeInfo['total_members'] }} জন</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </div>
    </div>

    <!-- Include Footer -->
    @include('components.footer')

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('assets/lib/wow/wow.min.js') }}"></script>
    <script src="{{ asset('assets/lib/easing/easing.min.js') }}"></script>
    <script src="{{ asset('assets/lib/waypoints/waypoints.min.js') }}"></script>
    <script src="{{ asset('assets/lib/owlcarousel/owl.carousel.min.js') }}"></script>

    <!-- Template Javascript -->
    <script src="{{ asset('assets/js/main.js') }}"></script>
</body>

</html>
