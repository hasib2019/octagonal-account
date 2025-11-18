<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{ config('app.name') }} - Documents</title>
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
                            ডকুমেন্ট সমূহ (Documents)
                        </h5>
                    </div>
                    
                    <div class="row g-4">
                        @php
                        $documents = [
                            ['title' => 'গঠনতন্ত্র (Constitution)', 'filename' => 'constitution.pdf', 'description' => 'সমিতির মূল গঠনতন্ত্র'],
                            ['title' => 'নিবন্ধন সনদ (Registration Certificate)', 'filename' => 'registration.pdf', 'description' => 'সরকারি নিবন্ধন সার্টিফিকেট'],
                            ['title' => 'সদস্য তালিকা (Member List)', 'filename' => 'members.pdf', 'description' => 'সদস্যদের সম্পূর্ণ তালিকা'],
                            ['title' => 'বার্ষিক প্রতিবেদন (Annual Report)', 'filename' => 'annual_report.pdf', 'description' => 'গত বছরের কার্যক্রমের প্রতিবেদন'],
                            ['title' => 'হিসাব বই (Account Book)', 'filename' => 'accounts.pdf', 'description' => 'আয়-ব্যয়ের হিসাব'],
                            ['title' => 'প্রকল্প প্রস্তাব (Project Proposal)', 'filename' => 'project_proposal.pdf', 'description' => 'আগামী প্রকল্পের প্রস্তাব']
                        ];
                        @endphp

                        @foreach($documents as $index => $doc)
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body text-center">
                                    <div class="mb-3">
                                        <i class="fas fa-file-pdf fa-3x text-danger"></i>
                                    </div>
                                    <h6 class="card-title">{{ $doc['title'] }}</h6>
                                    <p class="card-text text-muted small">{{ $doc['description'] }}</p>
                                    <div class="d-grid gap-2">
                                        <button class="btn btn-outline-primary btn-sm" onclick="viewDocument('{{ $doc['filename'] }}')">
                                            <i class="fas fa-eye me-2"></i>দেখুন
                                        </button>
                                        <a href="#" class="btn btn-primary btn-sm" onclick="downloadDocument('{{ $doc['filename'] }}')">
                                            <i class="fas fa-download me-2"></i>ডাউনলোড
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>

                    <!-- PDF Viewer Modal -->
                    <div class="modal fade" id="pdfModal" tabindex="-1" aria-labelledby="pdfModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="pdfModalLabel">ডকুমেন্ট দেখুন</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body p-0">
                                    <iframe id="pdfViewer" src="" width="100%" height="600px" style="border: none;"></iframe>
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

    <script>
        function viewDocument(filename) {
            // Set the PDF source for viewing
            document.getElementById('pdfViewer').src = '{{ asset("documents") }}/' + filename;
            // Show the modal
            var pdfModal = new bootstrap.Modal(document.getElementById('pdfModal'));
            pdfModal.show();
        }

        function downloadDocument(filename) {
            // Create a temporary link for download
            var link = document.createElement('a');
            link.href = '{{ asset("documents") }}/' + filename;
            link.download = filename;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    </script>
</body>

</html>