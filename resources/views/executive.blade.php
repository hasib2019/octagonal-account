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
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="glass-card-header mb-3">
                        <h5 class="text-center fw-bold" style="color:#045D5D; letter-spacing:1px; text-shadow:1px 2px 8px #fff8; font-size:1.5rem; font-family:'Poppins',sans-serif;">
                            কার্যনির্বাহী কমিটি (Executive Committee)
                        </h5>
                    </div>
                    
                    @php
                    $committees = [
                        [
                            'title' => 'সভাপতিমণ্ডলী (President)',
                            'members' => [
                                [
                                    'name' => 'মোঃ আবদুর রহিম',
                                    'name_en' => 'MD. ABDUR RAHIM',
                                    'position' => 'সভাপতি',
                                    'position_en' => 'President',
                                    'phone' => '01712345678',
                                    'email' => 'president@codergroup.org',
                                    'image' => 'president.jpg',
                                    'facebook' => '#',
                                    'linkedin' => '#'
                                ]
                            ]
                        ],
                        [
                            'title' => 'সহ-সভাপতিমণ্ডলী (Vice Presidents)',
                            'members' => [
                                [
                                    'name' => 'মোসাম্মৎ ফাতেমা খাতুন',
                                    'name_en' => 'MOSAMAT FATEMA KHATUN',
                                    'position' => 'সহ-সভাপতি',
                                    'position_en' => 'Vice President',
                                    'phone' => '01823456789',
                                    'email' => 'vp1@codergroup.org',
                                    'image' => 'vp1.jpg',
                                    'facebook' => '#'
                                ],
                                [
                                    'name' => 'মোঃ নজরুল ইসলাম',
                                    'name_en' => 'MD. NAZRUL ISLAM',
                                    'position' => 'সহ-সভাপতি',
                                    'position_en' => 'Vice President',
                                    'phone' => '01934567890',
                                    'email' => 'vp2@codergroup.org',
                                    'image' => 'vp2.jpg',
                                    'facebook' => '#'
                                ]
                            ]
                        ],
                        [
                            'title' => 'সাধারণ সম্পাদক (General Secretary)',
                            'members' => [
                                [
                                    'name' => 'মোঃ সাইফুর রহমান',
                                    'name_en' => 'MD. SAIFUR RAHMAN',
                                    'position' => 'সাধারণ সম্পাদক',
                                    'position_en' => 'General Secretary',
                                    'phone' => '01645678901',
                                    'email' => 'secretary@codergroup.org',
                                    'image' => 'secretary.jpg',
                                    'facebook' => '#',
                                    'linkedin' => '#',
                                    'twitter' => '#'
                                ]
                            ]
                        ],
                        [
                            'title' => 'কোষাধ্যক্ষ (Treasurer)',
                            'members' => [
                                [
                                    'name' => 'মোঃ আলী হোসেন',
                                    'name_en' => 'MD. ALI HOSSAIN',
                                    'position' => 'কোষাধ্যক্ষ',
                                    'position_en' => 'Treasurer',
                                    'phone' => '01756789012',
                                    'email' => 'treasurer@codergroup.org',
                                    'image' => 'treasurer.jpg',
                                    'facebook' => '#'
                                ]
                            ]
                        ],
                        [
                            'title' => 'নির্বাহী সদস্যবৃন্দ (Executive Members)',
                            'members' => [
                                [
                                    'name' => 'মোঃ রহিম উদ্দিন',
                                    'name_en' => 'MD. RAHIM UDDIN',
                                    'position' => 'নির্বাহী সদস্য',
                                    'position_en' => 'Executive Member',
                                    'phone' => '01867890123',
                                    'email' => 'member1@codergroup.org',
                                    'image' => 'member1.jpg'
                                ],
                                [
                                    'name' => 'মোসাম্মৎ রোকেয়া বেগম',
                                    'name_en' => 'MOSAMAT ROKEYA BEGUM',
                                    'position' => 'নির্বাহী সদস্য',
                                    'position_en' => 'Executive Member',
                                    'phone' => '01978901234',
                                    'email' => 'member2@codergroup.org',
                                    'image' => 'member2.jpg'
                                ],
                                [
                                    'name' => 'মোঃ করিম উল্লাহ',
                                    'name_en' => 'MD. KARIM ULLAH',
                                    'position' => 'নির্বাহী সদস্য',
                                    'position_en' => 'Executive Member',
                                    'phone' => '01589012345',
                                    'email' => 'member3@codergroup.org',
                                    'image' => 'member3.jpg'
                                ]
                            ]
                        ]
                    ];
                    @endphp

                    @foreach($committees as $committee)
                    <div class="row justify-content-center mb-5">
                        <div class="col-12">
                            <h4 class="text-center mb-4 fw-bold" style="color: #045D5D;">{{ $committee['title'] }}</h4>
                            
                            <div class="row g-4 justify-content-center">
                                @foreach($committee['members'] as $member)
                                <div class="col-md-6 col-lg-4">
                                    <div class="card border-0 shadow-lg h-100">
                                        <div class="card-body text-center p-4">
                                            <div class="position-relative mb-4">
                                                <div class="member-avatar mx-auto" style="width: 120px; height: 120px; border-radius: 50%; overflow: hidden; border: 4px solid #045D5D; background: linear-gradient(135deg, #045D5D, #067676);">
                                                    <img src="{{ asset('assets/img/team/' . $member['image']) }}" 
                                                         class="w-100 h-100" 
                                                         style="object-fit: cover;" 
                                                         alt="{{ $member['name'] }}"
                                                         onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                                                    <div class="d-none align-items-center justify-content-center w-100 h-100 text-white">
                                                        <i class="fas fa-user fa-3x"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <h5 class="fw-bold text-dark mb-1">{{ $member['name'] }}</h5>
                                            <p class="text-muted small mb-2">{{ $member['name_en'] }}</p>
                                            <h6 class="text-primary mb-3">{{ $member['position'] }}</h6>
                                            
                                            <div class="contact-info mb-3">
                                                <p class="mb-1 small">
                                                    <i class="fas fa-phone text-success me-2"></i>
                                                    <a href="tel:{{ $member['phone'] }}" class="text-decoration-none">{{ $member['phone'] }}</a>
                                                </p>
                                                <p class="mb-0 small">
                                                    <i class="fas fa-envelope text-primary me-2"></i>
                                                    <a href="mailto:{{ $member['email'] }}" class="text-decoration-none">{{ $member['email'] }}</a>
                                                </p>
                                            </div>
                                            
                                            <div class="social-links">
                                                @if(isset($member['facebook']))
                                                <a href="{{ $member['facebook'] }}" class="btn btn-outline-primary btn-sm me-2" target="_blank">
                                                    <i class="fab fa-facebook-f"></i>
                                                </a>
                                                @endif
                                                @if(isset($member['linkedin']))
                                                <a href="{{ $member['linkedin'] }}" class="btn btn-outline-primary btn-sm me-2" target="_blank">
                                                    <i class="fab fa-linkedin-in"></i>
                                                </a>
                                                @endif
                                                @if(isset($member['twitter']))
                                                <a href="{{ $member['twitter'] }}" class="btn btn-outline-primary btn-sm me-2" target="_blank">
                                                    <i class="fab fa-twitter"></i>
                                                </a>
                                                @endif
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    @endforeach

                    <!-- Committee Information -->
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="card border-0 shadow-sm">
                                <div class="card-body p-4">
                                    <h5 class="card-title text-center mb-4" style="color: #045D5D;">কমিটির তথ্য</h5>
                                    <div class="row g-4">
                                        <div class="col-md-6">
                                            <h6>কমিটি গঠনের তারিখ:</h6>
                                            <p>১৫ জানুয়ারি ২০২৪</p>
                                            
                                            <h6>কার্যকাল:</h6>
                                            <p>৩ (তিন) বছর</p>
                                        </div>
                                        <div class="col-md-6">
                                            <h6>পরবর্তী নির্বাচন:</h6>
                                            <p>১৪ জানুয়ারি ২০২৭</p>
                                            
                                            <h6>মোট সদস্য সংখ্যা:</h6>
                                            <p>৮ (আট) জন</p>
                                        </div>
                                    </div>
                                    
                                    <div class="mt-4">
                                        <h6>যোগাযোগের ঠিকানা:</h6>
                                        <address class="mb-0">
                                            কোডার গ্রুপ সমিতি<br>
                                            গ্রাম: বাঙ্গাইল, উপজেলা: সাভার<br>
                                            জেলা: ঢাকা, বাংলাদেশ<br>
                                            <strong>ফোন:</strong> +৮৮০ ১৭১২৩৪৫৬৭৮<br>
                                            <strong>ইমেইল:</strong> info@codergroup.org
                                        </address>
                                    </div>
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