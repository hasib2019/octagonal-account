<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ config('app.name') }} - Projects</title>
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
                            প্রকল্প সমূহ (Projects)
                        </h5>
                    </div>
                    
                    <div class="row g-4">
                        @php
                        $projects = [
                            [
                                'title' => 'কৃষি উন্নয়ন প্রকল্প',
                                'title_en' => 'Agricultural Development Project',
                                'description' => 'স্থানীয় কৃষকদের জন্য আধুনিক কৃষি প্রযুক্তি ও প্রশিক্ষণ প্রদান',
                                'budget' => '৫,০০,০০০ টাকা',
                                'start_date' => '০১ জানুয়ারি ২০২৪',
                                'end_date' => '৩১ ডিসেম্বর ২০২৪',
                                'status' => 'চালু',
                                'progress' => '৬৫',
                                'icon' => 'fas fa-seedling',
                                'color' => 'success'
                            ],
                            [
                                'title' => 'শিক্ষা বৃত্তি প্রকল্প',
                                'title_en' => 'Education Scholarship Project',
                                'description' => 'মেধাবী ও দরিদ্র শিক্ষার্থীদের জন্য শিক্ষা বৃত্তি প্রদান',
                                'budget' => '৩,০০,০০০ টাকা',
                                'start_date' => '০১ জুলাই ২০২৪',
                                'end_date' => '৩০ জুন ২০২৫',
                                'status' => 'চালু',
                                'progress' => '৪০',
                                'icon' => 'fas fa-graduation-cap',
                                'color' => 'primary'
                            ],
                            [
                                'title' => 'স্বাস্থ্য সেবা প্রকল্প',
                                'title_en' => 'Healthcare Service Project',
                                'description' => 'গ্রামীণ এলাকায় বিনামূল্যে স্বাস্থ্য সেবা প্রদান',
                                'budget' => '৪,৫০,০০০ টাকা',
                                'start_date' => '১৫ মার্চ ২০২৪',
                                'end_date' => '১৪ মার্চ ২০২৫',
                                'status' => 'চালু',
                                'progress' => '৮০',
                                'icon' => 'fas fa-heartbeat',
                                'color' => 'danger'
                            ],
                            [
                                'title' => 'পানি সরবরাহ প্রকল্প',
                                'title_en' => 'Water Supply Project',
                                'description' => 'বিশুদ্ধ পানির নিশ্চয়তা ও টিউবওয়েল স্থাপন',
                                'budget' => '৬,০০,০০০ টাকা',
                                'start_date' => '০১ অক্টোবর ২০২৩',
                                'end_date' => '৩০ সেপ্টেম্বর ২০২৪',
                                'status' => 'সমাপ্ত',
                                'progress' => '১০০',
                                'icon' => 'fas fa-tint',
                                'color' => 'info'
                            ],
                            [
                                'title' => 'মহিলা ক্ষমতায়ন প্রকল্প',
                                'title_en' => 'Women Empowerment Project',
                                'description' => 'মহিলাদের আত্মনির্ভরশীল করার জন্য প্রশিক্ষণ ও ঋণ সহায়তা',
                                'budget' => '৩,৫০,০০০ টাকা',
                                'start_date' => '০৮ মার্চ ২০২৪',
                                'end_date' => '০৭ মার্চ ২০২৫',
                                'status' => 'চালু',
                                'progress' => '৫৫',
                                'icon' => 'fas fa-female',
                                'color' => 'warning'
                            ],
                            [
                                'title' => 'পরিবেশ সংরক্ষণ প্রকল্প',
                                'title_en' => 'Environmental Conservation Project',
                                'description' => 'বৃক্ষরোপণ ও পরিবেশ সচেতনতা বৃদ্ধির কার্যক্রম',
                                'budget' => '২,৫০,০০০ টাকা',
                                'start_date' => '৫ জুন ২০২৪',
                                'end_date' => '৫ জুন ২০২৫',
                                'status' => 'পরিকল্পিত',
                                'progress' => '১০',
                                'icon' => 'fas fa-leaf',
                                'color' => 'success'
                            ]
                        ];
                        @endphp

                        @foreach($projects as $project)
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <div class="icon-box bg-{{ $project['color'] }} bg-opacity-10 p-3 rounded">
                                            <i class="{{ $project['icon'] }} fa-2x text-{{ $project['color'] }}"></i>
                                        </div>
                                        <span class="badge bg-{{ $project['color'] }} text-white">{{ $project['status'] }}</span>
                                    </div>
                                    
                                    <h6 class="card-title fw-bold mb-2">{{ $project['title'] }}</h6>
                                    <p class="text-muted small mb-1">{{ $project['title_en'] }}</p>
                                    <p class="card-text small">{{ $project['description'] }}</p>
                                    
                                    <div class="project-details mb-3">
                                        <div class="row g-2 small">
                                            <div class="col-12">
                                                <strong>বাজেট:</strong> {{ $project['budget'] }}
                                            </div>
                                            <div class="col-6">
                                                <strong>শুরু:</strong> {{ $project['start_date'] }}
                                            </div>
                                            <div class="col-6">
                                                <strong>শেষ:</strong> {{ $project['end_date'] }}
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="progress mb-2" style="height: 8px;">
                                        <div class="progress-bar bg-{{ $project['color'] }}" 
                                             role="progressbar" 
                                             style="width: {{ $project['progress'] }}%" 
                                             aria-valuenow="{{ $project['progress'] }}" 
                                             aria-valuemin="0" 
                                             aria-valuemax="100">
                                        </div>
                                    </div>
                                    <small class="text-muted">অগ্রগতি: {{ $project['progress'] }}%</small>
                                </div>
                                
                                <div class="card-footer bg-transparent border-0 pt-0">
                                    <div class="d-grid">
                                        <button class="btn btn-outline-{{ $project['color'] }} btn-sm" 
                                                data-bs-toggle="modal" 
                                                data-bs-target="#projectModal{{ $loop->index }}">
                                            <i class="fas fa-info-circle me-2"></i>বিস্তারিত
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Project Detail Modal -->
                        <div class="modal fade" id="projectModal{{ $loop->index }}" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header bg-{{ $project['color'] }} text-white">
                                        <h5 class="modal-title">
                                            <i class="{{ $project['icon'] }} me-2"></i>{{ $project['title'] }}
                                        </h5>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <h6>প্রকল্পের বিবরণ:</h6>
                                                <p>{{ $project['description'] }}</p>
                                                
                                                <h6>উদ্দেশ্য:</h6>
                                                <ul>
                                                    <li>সমাজের কল্যাণে অবদান রাখা</li>
                                                    <li>টেকসই উন্নয়ন নিশ্চিত করা</li>
                                                    <li>সদস্যদের সক্ষমতা বৃদ্ধি</li>
                                                </ul>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="card bg-light">
                                                    <div class="card-body">
                                                        <h6 class="card-title">প্রকল্পের তথ্য</h6>
                                                        <p class="mb-1"><strong>বাজেট:</strong><br>{{ $project['budget'] }}</p>
                                                        <p class="mb-1"><strong>শুরুর তারিখ:</strong><br>{{ $project['start_date'] }}</p>
                                                        <p class="mb-1"><strong>শেষের তারিখ:</strong><br>{{ $project['end_date'] }}</p>
                                                        <p class="mb-1"><strong>অবস্থা:</strong><br>
                                                            <span class="badge bg-{{ $project['color'] }}">{{ $project['status'] }}</span>
                                                        </p>
                                                        <p class="mb-1"><strong>অগ্রগতি:</strong></p>
                                                        <div class="progress mb-1" style="height: 10px;">
                                                            <div class="progress-bar bg-{{ $project['color'] }}" 
                                                                 style="width: {{ $project['progress'] }}%"></div>
                                                        </div>
                                                        <small>{{ $project['progress'] }}% সম্পন্ন</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
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