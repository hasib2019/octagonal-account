<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ config('app.name') }} - Member Registration</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="{{ asset('assets/img/favicon.ico') }}" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Space+Grotesk&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

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
    
    <style>
        .signatures{display:flex;justify-content:space-between;gap:20px;margin-top:36px}
        .sig{flex:1;text-align:center}
        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.37);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        .form-section {
            margin-bottom: 25px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
            border-left: 4px solid #045D5D;
        }
        .form-section h5 {
            color: #045D5D;
            margin-bottom: 15px;
            font-weight: 600;
        }
        .required-field::after {
            content: " *";
            color: red;
        }
    </style>
</head>

<body>
    <!-- Navbar Start -->
    <div class="container-fluid bg-light sticky-top">
        <div class="container">
            <x-navigation />
        </div>
    </div>
    <!-- Navbar End -->

    <!-- Hero Start -->
    <div class="container-fluid pb-5 hero-header bg-light">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="glass-card">
                        <h5 class="text-center fw-bold mb-4" style="color:#045D5D; letter-spacing:1px; text-shadow:1px 2px 8px #fff8; font-size:1.5rem; font-family:'Poppins',sans-serif;">
                            সদস্য নিবন্ধন ফর্ম ( Member Registration Form )
                        </h5>
                        <hr />
                        
                        <!-- Rules and Regulations Section -->
                        <div class="mb-4">
                            <h5 class="fw-bold mb-3" style="color:#008080;">নিয়মাবলি ও বিধান</h5>
                            
                            <section class="mb-4">
                                <h6>নাম ও ঠিকানা ( Name & Address )</h6>
                                <ul>
                                    <li>সমিতির নাম: "কোডার পেশাজীবী সমবায় সমিতি লিঃ" (Coder Peshajibi Samabay Samity Ltd.)</li>
                                    <li>সমিতির প্রধান কার্যালয়ের ঠিকানা: ১০/এ-৩, (৮ম তলা) বর্ধন বাড়ি, দারুস সালাম থানা, মিরপুর, ঢাকা-১২১৬</li>
                                    <li>সমিতির ঠিকানা পরিবর্তন করা যাবে নির্বাহী কমিটির অনুমোদন সাপেক্ষে।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>সদস্যপদ</h6>
                                <ul>
                                    <li>যে কোনো প্রাপ্তবয়স্ক (১৮ বছর বা তার বেশি) ব্যক্তি যিনি বাংলাদেশের নাগরিক, তিনি সদস্য হতে পারবেন।</li>
                                    <li>সদস্যপদ গ্রহণের জন্য এন্ট্রি ফি ৳ ১৫০০/= (মাত্র এক হাজার পাঁচশত) টাকা দিতে হবে (অফেরতযোগ্য)।</li>
                                    <li>সদস্য হতে হলে কমপক্ষে ২(দুই) টি শেয়ার ক্রয় করতে হবে।</li>
                                    <li>প্রতি শেয়ারের দাম: <strong>৳ ৫,০০০/- (মাত্র পাঁচ হাজার) টাকা</strong> (এককালীন)।</li>
                                </ul>
                            </section>

                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="sig">
                                        <div>মোঃ সাইফুর রহমান (Md. Saifur Rahman)</div>
                                        <div>_______________________________________</div>
                                        <div>সভাপতি (President)</div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="sig">
                                        <div>সিরাজুল ইসলাম (Shirajul Islam)</div>
                                        <div>_______________________________________</div>
                                        <div>সম্পাদক (Secretary)</div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-check mt-4">
                                <input class="form-check-input" type="checkbox" value="1" id="agreeRules">
                                <label class="form-check-label" for="agreeRules" style="color:#001d00"> 
                                    আমি উপরোল্লিখিত সকল নিয়মাবলি পড়েছি এবং সম্যকভাবে মেনে চলার অঙ্গীকার সহ সমিতিতে সদস্য হওয়ার উদ্যোগ গ্রহণ করলাম। 
                                </label>
                            </div>
                            
                            <div class="text-center mt-4">
                                <button id="goToFormBtn" class="btn btn-success btn-lg rounded-pill px-5" style="display:none;letter-spacing:1px;">
                                    নিবন্ধনটি এগিয়ে যান ( Proceed to Registration Form )
                                </button>
                            </div>
                        </div>

                        <!-- Registration Form -->
                        <div id="registrationFormSection" style="display:none;">
                            @if(session('success'))
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    {{ session('success') }}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            @endif

                            @if(session('error'))
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    {{ session('error') }}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            @endif

                            @if($errors->any())
                                <div class="alert alert-danger">
                                    <ul class="mb-0">
                                        @foreach($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            <form method="POST" action="{{ url('/registration') }}" enctype="multipart/form-data" class="needs-validation" novalidate>
                                @csrf
                                
                                <!-- Personal Information -->
                                <div class="form-section">
                                    <h5><i class="fas fa-user me-2"></i>ব্যক্তিগত তথ্য (Personal Information)</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">প্রথম নাম (First Name)</label>
                                                <input type="text" class="form-control" name="first_name" value="{{ old('first_name') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">শেষ নাম (Last Name)</label>
                                                <input type="text" class="form-control" name="last_name" value="{{ old('last_name') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">প্রথম নাম (বাংলা)</label>
                                                <input type="text" class="form-control" name="first_name_bn" value="{{ old('first_name_bn') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">শেষ নাম (বাংলা)</label>
                                                <input type="text" class="form-control" name="last_name_bn" value="{{ old('last_name_bn') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">পিতার নাম</label>
                                                <input type="text" class="form-control" name="father_name" value="{{ old('father_name') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">মাতার নাম</label>
                                                <input type="text" class="form-control" name="mother_name" value="{{ old('mother_name') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">জাতীয় পরিচয়পত্র নম্বর</label>
                                                <input type="text" class="form-control" name="nid_number" value="{{ old('nid_number') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">জন্ম তারিখ</label>
                                                <input type="date" class="form-control" name="birth_date" value="{{ old('birth_date') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">লিঙ্গ</label>
                                                <select class="form-select" name="gender" required>
                                                    <option value="">নির্বাচন করুন</option>
                                                    <option value="male" {{ old('gender') == 'male' ? 'selected' : '' }}>পুরুষ</option>
                                                    <option value="female" {{ old('gender') == 'female' ? 'selected' : '' }}>মহিলা</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">ধর্ম</label>
                                                <input type="text" class="form-control" name="religion" value="{{ old('religion') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">বৈবাহিক অবস্থা</label>
                                                <select class="form-select" name="marital_status" required>
                                                    <option value="">নির্বাচন করুন</option>
                                                    <option value="single" {{ old('marital_status') == 'single' ? 'selected' : '' }}>অবিবাহিত</option>
                                                    <option value="married" {{ old('marital_status') == 'married' ? 'selected' : '' }}>বিবাহিত</option>
                                                    <option value="divorced" {{ old('marital_status') == 'divorced' ? 'selected' : '' }}>তালাকপ্রাপ্ত</option>
                                                    <option value="widowed" {{ old('marital_status') == 'widowed' ? 'selected' : '' }}>বিধবা/বিপত্নীক</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">পেশা</label>
                                                <input type="text" class="form-control" name="profession" value="{{ old('profession') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">শিক্ষাগত যোগ্যতা</label>
                                                <input type="text" class="form-control" name="education" value="{{ old('education') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">মাসিক আয় (টাকা)</label>
                                                <input type="number" class="form-control" name="monthly_income" value="{{ old('monthly_income') }}" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Contact Information -->
                                <div class="form-section">
                                    <h5><i class="fas fa-phone me-2"></i>যোগাযোগের তথ্য (Contact Information)</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">মোবাইল নম্বর</label>
                                                <input type="text" class="form-control" name="mobile" value="{{ old('mobile') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">ইমেইল ঠিকানা</label>
                                                <input type="email" class="form-control" name="email" value="{{ old('email') }}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">স্থায়ী ঠিকানা</label>
                                                <textarea class="form-control" name="permanent_address" rows="3" required>{{ old('permanent_address') }}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">বর্তমান ঠিকানা</label>
                                                <textarea class="form-control" name="present_address" rows="3">{{ old('present_address') }}</textarea>
                                                <small class="text-muted">খালি রাখলে স্থায়ী ঠিকানাই বর্তমান ঠিকানা হবে</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Nominee Information -->
                                <div class="form-section">
                                    <h5><i class="fas fa-users me-2"></i>মনোনীত ব্যক্তির তথ্য (Nominee Information)</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">মনোনীত ব্যক্তির নাম</label>
                                                <input type="text" class="form-control" name="nominee_name" value="{{ old('nominee_name') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">সম্পর্ক</label>
                                                <input type="text" class="form-control" name="nominee_relation" value="{{ old('nominee_relation') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">মনোনীত ব্যক্তির NID</label>
                                                <input type="text" class="form-control" name="nominee_nid" value="{{ old('nominee_nid') }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">মনোনীত ব্যক্তির ঠিকানা</label>
                                                <textarea class="form-control" name="nominee_address" rows="3" required>{{ old('nominee_address') }}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Share Information -->
                                <div class="form-section">
                                    <h5><i class="fas fa-chart-pie me-2"></i>শেয়ার তথ্য (Share Information)</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label required-field">শেয়ার সংখ্যা (কমপক্ষে ২টি)</label>
                                                <input type="number" class="form-control" name="shares_count" value="{{ old('shares_count', 2) }}" min="2" required>
                                                <small class="text-muted">প্রতি শেয়ারের মূল্য: ৫,০০০ টাকা</small>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">রেফারেন্স সদস্য কোড (যদি থাকে)</label>
                                                <input type="text" class="form-control" name="reference_member_code" value="{{ old('reference_member_code') }}">
                                                <small class="text-muted">রেফারেন্স দিলে ১০০ টাকা ভাতা পাবেন</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Document Upload -->
                                <div class="form-section">
                                    <h5><i class="fas fa-upload me-2"></i>ডকুমেন্ট আপলোড (Document Upload)</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">ছবি (Photo)</label>
                                                <input type="file" class="form-control" name="photo" accept="image/*">
                                                <small class="text-muted">সর্বোচ্চ ফাইল সাইজ: 2MB</small>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">NID কার্ডের ছবি</label>
                                                <input type="file" class="form-control" name="nid_image" accept="image/*">
                                                <small class="text-muted">সর্বোচ্চ ফাইল সাইজ: 2MB</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Agreement -->
                                <div class="form-check mb-4">
                                    <input class="form-check-input" type="checkbox" name="agree_rules" value="1" id="agreeFinalRules" required>
                                    <label class="form-check-label" for="agreeFinalRules" style="color:#001d00">
                                        আমি এতদ্বারা ঘোষণা করছি যে, উপরে প্রদত্ত সমস্ত তথ্য সত্য এবং আমি সমিতির সকল নিয়মকানুন মেনে চলতে প্রতিশ্রুতিবদ্ধ।
                                    </label>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-success btn-lg px-5">
                                        <i class="fas fa-paper-plane me-2"></i>আবেদন জমা দিন (Submit Application)
                                    </button>
                                </div>
                            </form>
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

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const agreeRules = document.getElementById('agreeRules');
            const goToFormBtn = document.getElementById('goToFormBtn');
            const registrationFormSection = document.getElementById('registrationFormSection');

            agreeRules.addEventListener('change', function() {
                if (this.checked) {
                    goToFormBtn.style.display = 'block';
                } else {
                    goToFormBtn.style.display = 'none';
                }
            });

            goToFormBtn.addEventListener('click', function() {
                registrationFormSection.style.display = 'block';
                this.scrollIntoView({ behavior: 'smooth' });
            });

            // Form validation
            const forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function(form) {
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });

            // Calculate total share amount
            const sharesInput = document.querySelector('input[name="shares_count"]');
            if (sharesInput) {
                const sharePrice = 5000;
                const updateShareAmount = () => {
                    const shares = parseInt(sharesInput.value) || 2;
                    const total = shares * sharePrice;
                    const small = sharesInput.nextElementSibling;
                    small.textContent = `প্রতি শেয়ারের মূল্য: ৫,০০০ টাকা | মোট: ${total.toLocaleString('bn-BD')} টাকা`;
                };
                
                sharesInput.addEventListener('input', updateShareAmount);
                updateShareAmount();
            }
        });
    </script>
</body>

</html>