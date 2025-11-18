<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ config('app.name') }} - Members List</title>
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
            <div class="col-12 col-md-12 col-lg-12 col-xl-12">
                <div class="glass-card-header mb-1">
                    <h5 class="text-center fw-bold" style="color:#045D5D; letter-spacing:1px; text-shadow:1px 2px 8px #fff8; font-size:1.5rem; font-family:'Poppins',sans-serif;">
                        সদস্যদের তালিকা ( List of members )
                    </h5> 
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">ক্রমিক নং</th>
                                    <th scope="col">সদস্য কোড</th>
                                    <th scope="col">নাম</th>
                                    <th scope="col">শেয়ার সংখ্যা</th>
                                    <th scope="col">পিতার নাম</th>
                                    <th scope="col">মাতার নাম</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php 
                                use App\Models\Member;
                                $rownum = 1;
                                // Get actual members from database (remove status filter to show all members)
                                $members = Member::withoutGlobalScope('status')->get();
                                
                                // If no members exist, show sample data
                                if($members->isEmpty()) {
                                    $sampleMembers = [
                                        ['member_code' => 'CPSS-00001', 'name_en' => 'MD. SAIFUR RAHMAN', 'name_bn' => 'মোঃ সাইফুর রহমান', 'shares' => '5', 'father_name' => 'মোঃ আবদুল করিম', 'mother_name' => 'মোসাম্মৎ ফাতেমা খাতুন'],
                                        ['member_code' => 'CPSS-00002', 'name_en' => 'SHIRAJUL ISLAM', 'name_bn' => 'সিরাজুল ইসলাম', 'shares' => '3', 'father_name' => 'মোঃ নজরুল ইসলাম', 'mother_name' => 'মোসাম্মৎ রাবেয়া খাতুন'],
                                        ['member_code' => 'CPSS-00003', 'name_en' => 'AHMED HASAN', 'name_bn' => 'আহমেদ হাসান', 'shares' => '4', 'father_name' => 'মোঃ আলী হোসেন', 'mother_name' => 'মোসাম্মৎ সালমা খাতুন'],
                                    ];
                                    foreach($sampleMembers as $member) {
                                @endphp
                                <tr>
                                    <td class="text-center">{{ $rownum++ }}</td>
                                    <td>{{ $member['member_code'] }}</td>
                                    <td>
                                        {{ $member['name_en'] }}<br/>
                                        {{ $member['name_bn'] }}
                                    </td>
                                    <td class="text-center">{{ $member['shares'] }}</td>
                                    <td>{{ $member['father_name'] }}</td>
                                    <td>{{ $member['mother_name'] }}</td>
                                </tr>
                                @php 
                                    }
                                } else {
                                    // Display actual members from database
                                    foreach($members as $member) {
                                        $customFields = json_decode($member->custom_fields, true);
                                        $sharesCount = $customFields['shares_count'] ?? 2;
                                @endphp
                                <tr>
                                    <td class="text-center">{{ $rownum++ }}</td>
                                    <td>{{ $member->member_no ?? 'CPSS-' . str_pad($member->id, 5, '0', STR_PAD_LEFT) }}</td>
                                    <td>
                                        {{ $member->first_name }} {{ $member->last_name }}<br/>
                                        {{ $member->first_name_bn }} {{ $member->last_name_bn }}
                                    </td>
                                    <td class="text-center">{{ $sharesCount }}</td>
                                    <td>{{ $member->father_name }}</td>
                                    <td>{{ $member->mother_name }}</td>
                                </tr>
                                @php 
                                    }
                                }
                                @endphp
                            </tbody>
                        </table>
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