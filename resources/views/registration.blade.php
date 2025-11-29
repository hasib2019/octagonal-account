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
                        <div class="mb-4" id="rulesSection">
                            <h5 class="fw-bold mb-3" style="color:#008080;">নিয়মাবলি ও বিধান</h5>
                            
                            <section class="mb-4">
                                <h6>নাম ও ঠিকানা ( Name & Address )</h6>
                                <ul>
                                    <li>সমিতির নাম: "অক্টাগোনাল সমবায় সমিতি লিঃ" (Octagonal Samabay Samity Ltd.)</li>
                                    <li>সমিতির প্রধান কার্যালয়ের ঠিকানা: ২১৭/১ ৩য় কোলনী, লালকুঠি, দারুস সালাম থানা, মিরপুর, ঢাকা-১২১৬ (Head Office Address: 217/1, 3rd Colony, LalKuthi, Darus Salam Thana, Mirpur, Dhaka-1216)</li>
                                    <li>সমিতির ঠিকানা পরিবর্তন করা যাবে নির্বাহী কমিটির অনুমোদন সাপেক্ষে। (The address may be changed with approval of the Executive Committee.)</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>লক্ষ্য ও উদ্দেশ্য</h6>
                                <ul>
                                    <li>সদস্যদের ক্ষুদ্র ক্ষুদ্র সঞ্চয়ের মাধ্যমে আর্থিক উন্নয়নে সহায়তা করা।</li>
                                    <li>সুলভ শর্তে ঋণ প্রদান এবং ব্যবসায়িক উদ্যোগে সহায়তা করা।</li>
                                    <li>সদস্যদের মধ্যে পারস্পরিক সহযোগিতা বৃদ্ধি করা।</li>
                                    <li>সদস্যদের মৌলিক চাহিদা (বাসস্থান, চিকিৎসা, শিক্ষা, খাদ্য ও বস্ত্র) পূরণে বিভিন্ন প্রকল্প কার্যক্রম পরিচালনা করা।</li>
                                    <li>যৌথ ব্যবসা, ক্রয়-বিক্রয় ও উৎপাদন এবং প্রকল্পভিত্তিক কার্যক্রম পরিচালনা করা।</li>
                                    <li>সদস্যদের প্রযুক্তিগত ও পেশাগত উন্নয়ন নিশ্চিত করা।</li>
                                    <li>যৌথ উদ্যোগ ও ফ্রিল্যান্সিংয়ের মাধ্যমে কর্মসংস্থানের সুযোগ সৃষ্টি।</li>
                                    <li>কর্মসংস্থানের প্রশিক্ষণ ও কর্মশালা এবং বিনোদন ও অবসর কার্যক্রম আয়োজন করা।</li>
                                    <li>সমিতির উদ্দেশ্য পরিবর্তন করা যাবে সমবায় অধিদপ্তরের নীতিমালা ও নির্বাহী কমিটির অনুমোদন সাপেক্ষে।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>সদস্যপদ</h6>
                                <ul>
                                    <li>যে কোনো প্রাপ্তবয়স্ক (১৮ বছর বা তার বেশি) বাংলাদেশি নাগরিক সদস্য হতে পারবেন।</li>
                                    <li>এন্ট্রি ফি: ৳ ১৫০০/= (অফেরতযোগ্য)।</li>
                                    <li>চিপ ভিত্তিক আইডি কার্ড: ৳ ১৫০/=, সদস্য ও শেয়ার সার্টিফিকেট: ৳ ২০০/=, সফটওয়্যার চার্জ: ৳ ৪০০/=, এসএমএস ও ইমেইল চার্জ: ৳ ১০০/=, অফিস ভাড়া: ৳ ৩০০/=, কর্মকর্তা-কর্মচারী ভাতা: ৳ ২০০/=, বিবিধ ব্যয়: ৳ ১৫০/=।</li>
                                    <li>সদস্য হতে হলে কমপক্ষে ২(দুই) টি শেয়ার ক্রয় করতে হবে।</li>
                                    <li>সদস্যপদ কমপক্ষে ২ বছর বহাল রেখে স্থগিত/বাতিল/প্রত্যাখ্যানের ক্ষেত্রে নির্বাহী কমিটির সিদ্ধান্ত চূড়ান্ত। সেক্ষেত্রে সদস্যপদ বাতিলের পূর্বে সদস্য কর্তৃক দেয়া সকল অর্থের ৯৫% টাকা প্রদান করা হবে বাকি ৫% একাউন্ট মেইন্টেন্স এবং অনান্য খরচ বাবদ রেখে দেয়া হবে। আর কারো যদি এমন পরিস্থিতি হয় যে তার জরুরী টাকার প্রয়োজন এবং সে সেভিংস চলমান রাখতে আগ্রহী তাহলে সবার সম্মতি প্রদানে তার জমানো টাকার যেকোন অংশ তাকে দিয়ে সাহায্য করা হবে এবং তা ‍নির্দিষ্ট সময়ের মধ্যে তা পরিশোধ করতে হবে। অবশ্যই গ্রহনযোগ্য কারন এবং সবার সম্মতি থাকতে হবে।</li>
                                    <li>সদস্যপদ হস্তান্তরযোগ্য নয় কিন্তু শেয়ার হস্তান্তরযোগ্য হবে।</li>
                                    <li>সদস্যদের তথ্য গোপন রাখা হবে; তথ্য হালনাগাদ রাখা সদস্যদের দায়িত্ব।</li>
                                    <li>সদস্য ও শেয়ার রেফারেন্স ভাতা: ৳ ১০০/= রেফারেন্সকারীকে প্রদান।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>শেয়ার ও মাসিক জমা</h6>
                                <ul>
                                    <li>প্রতি শেয়ারের দাম: ৳ ২,৫০০/- (এককালীন)।</li>
                                    <li>কোনো সদস্য সর্বোচ্চ মোট শেয়ারের ১০% এর বেশি ক্রয় করতে পারবেন না।</li>
                                    <li>মাসিক জমা: ৳ ২,৫০০/- (চলমান), বছরান্তে আলোচনা সাপেক্ষে পরিবর্তনযোগ্য।</li>
                                    <li>মাসিক জমা প্রতি মাসের ১০ তারিখের মধ্যে জমা দিতে হবে; বিলম্বে ৳ ১০০/- জরিমানা দিতে হবে। এবং এই জরিমানা প্রতি মাসে ১০০ টাকা করে বাড়তে থাকবে যতক্ষন না সেই মাসের টাকা পরিশোধ করা হয়।</li>
                                    <li>যখন কারো দুই মাসের পেমেন্ট বাকি থাকে, সে শুধুমাত্র এক মাসের পেমেন্ট দিতে চায় আমরা তখন ১ম মাসের পেমেন্ট বিবেচনা করব এবং তাকে ২য় মাসের দেরী পেমেন্ট এর জন্য জরিমানা দিতে হবে।</li>
                                    <li>অতিরিক্ত সঞ্চয় জমা দেওয়া যাবে; পৃথক হিসাব রেকর্ড হবে।</li>
                                    <li>শেয়ার হস্তান্তরে সমিতিকে ২ মাস আগে অবগতির মাধ্যমে অন্য সদস্যকে হস্তান্তর করা যাবে; ৫% স্থানান্তর ফি প্রযোজ্য।</li>
                                    <li>স্থানান্তরের পর নতুন শেয়ারধারীর নামে সার্টিফিকেট ও রেকর্ড সংশোধন করতে হবে।</li>
                                    <li class="list-unstyled">
                                        <div class="alert alert-warning bg-opacity-25 border border-2 rounded-3 shadow-sm mb-2">
                                            <strong>বিশেষ সুবিধা (Penalty Waiver)</strong><br>
                                            বিশেষ পরিস্থিতিতে ১৫ তারিখের আগে লিখিত আবেদন করলে বিলম্ব জরিমানা মওকুফের জন্য বিবেচনা করা হবে। অনুমোদন পেলে বছরে একবার নিম্ন নিয়ম প্রযোজ্য:
                                            <ul class="mt-2 mb-0 ps-3">
                                                <li>৩ মাসের মধ্যে ১ মাসের জমা পরিশোধ করলে বাকি ২ মাসের জরিমানা প্রযোজ্য থাকবে।</li>
                                                <li>২ মাসের জমা পরিশোধ করলে ১ মাসের জরিমানা প্রযোজ্য হবে।</li>
                                                <li>৩ মাসের কোনো জমা পরিশোধ না করলে ৩ মাসের জরিমানা প্রযোজ্য হবে।</li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>মূলধন</h6>
                                <ul>
                                    <li>উৎস: সদস্যদের শেয়ার মূলধন, সঞ্চয় আমানত, রিজার্ভ তহবিল, লাভের অবশিষ্ট পুনঃবিনিয়োগ, দান/অনুদান/সরকারি সহায়তা (যদি থাকে)।</li>
                                    <li>ব্যবহার: আর্থিক কার্যক্রম, ঋণ বিতরণ, সম্পদ ক্রয় ও বিনিয়োগে সীমাবদ্ধ।</li>
                                    <li>ব্যক্তিগত কাজে বা অ-সদস্যকে ঋণ দিতে ব্যবহার করা যাবে না।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>রিজার্ভ তহবিল ও শেয়ারের উপর লাভ/ক্ষতি</h6>
                                <ul>
                                    <li>প্রতি বছর লাভের কমপক্ষে ১০% শিক্ষা তহবিল, ১০% রিজার্ভ, ১০% উন্নয়ন তহবিলে জমা রাখতে হবে।</li>
                                    <li>ব্যয় বাদ দিয়ে অবশিষ্ট লাভের সর্বোচ্চ ৭০% সদস্যদের মধ্যে শেয়ার অনুযায়ী বণ্টন।</li>
                                    <li>রিজার্ভ তহবিল জরুরি পরিস্থিতি/ক্ষতি পূরণে ব্যবহারযোগ্য; আলাদা ব্যাংক হিসাবে রাখতে হবে।</li>
                                    <li>অর্থবছর শেষে নিরীক্ষা সম্পন্ন হওয়ার পর লাভ/ক্ষতি বণ্টন; নগদ বা হিসাবের মাধ্যমে পাসবুকে জমা।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>অতিরিক্ত বিনিয়োগ</h6>
                                <ul>
                                    <li>নির্বাহী কমিটি সদস্যদের কাছ থেকে ঐচ্ছিক বিনিয়োগ/বিশেষ শেয়ার ফান্ড সংগ্রহ করতে পারবে।</li>
                                    <li>এই বিনিয়োগে সার্ভিস চার্জ বা লাভ/ক্ষতির হার সাধারণ শেয়ার থেকে আলাদা হতে পারে; নির্বাহী কমিটি নির্ধারণ করবে।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>ঋণ প্রদান</h6>
                                <ul>
                                    <li>সদস্যরা তাদের সঞ্চয় ও শেয়ারের ভিত্তিতে ঋণ আবেদন করতে পারবেন।</li>
                                    <li>মোট মাসিক জমার ৮০% পর্যন্ত ঋণ উত্তোলন করা যাবে।</li>
                                    <li>সার্ভিস চার্জ, মেয়াদ ও শর্তাবলী নির্বাহী কমিটি নির্ধারণ করবে; খেলাপিতে আইনানুগ ব্যবস্থা।</li>
                                    <li>ঋণ অনুমোদন প্রক্রিয়া, মাসিক কিস্তি, বিলম্ব জরিমানা ও পরিশোধ মাধ্যম (ব্যাংক ড্রাফট/চেক) নির্ধারিত হবে।</li>
                                    <li>ঋণ পরিশোধের জন্য স্বাক্ষরিত গ্যারান্টি ফর্ম জমা দিতে হবে।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>সভা</h6>
                                <ul>
                                    <li>বার্ষিক সাধারণ সভা (AGM) সর্বোচ্চ ক্ষমতাসম্পন্ন সংস্থা।</li>
                                    <li>বিশেষ সাধারণ সভা (EGM) নির্বাহী কমিটি বা নির্দিষ্ট অনুপাতের সদস্যদের আহ্বানে অনুষ্ঠিত হবে।</li>
                                    <li>কোরাম ও ভোটাধিকার শেয়ার ও জমার ভিত্তিতে; সিদ্ধান্তে সরল সংখ্যাগরিষ্ঠতা।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>উদ্যোক্তা বা প্রতিষ্ঠাতা কমিটি</h6>
                                <ul>
                                    <li>লক্ষ্য ও উদ্দেশ্য বাস্তবায়নে সক্রিয় ভূমিকা পালন।</li>
                                    <li>নতুন সদস্যদের উদ্বুদ্ধকরণ ও নীতি অনুসরণে সহায়তা।</li>
                                    <li>আর্থিক স্বচ্ছতা, জবাবদিহিতা ও সম্পদ সুরক্ষায় সচেষ্ট থাকা।</li>
                                    <li>উন্নয়নশীল বিনিয়োগ ও সঠিক ব্যবহারে নজরদারি; অনুকরণীয় আচরণ প্রদর্শন।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>নির্বাহী কমিটি</h6>
                                <ul>
                                    <li>সমিতির কার্যক্রম পরিচালনার জন্য একটি নির্বাহী কমিটি গঠন করা হবে।</li>
                                    <li>নির্বাহী কমিটি সদস্য সংখ্যা হবে ৬, ৯ ও ১২ জন; মেয়াদান্তে সাধারণ সভায় স্বাধীন নির্বাচনের মাধ্যমে নির্বাচিত হবে।</li>
                                    <li>পদবীসমূহ: সভাপতি, সহ-সভাপতি, সম্পাদক, কোষাধ্যক্ষ এবং অন্যান্য পদ।</li>
                                    <li>নির্বাহী কমিটির সদস্যদের মেয়াদ হবে ২ (বা ৩) বছর।</li>
                                    <li>পদোন্নতি বা পরিবর্তন বার্ষিক সাধারণ সভার অনুমোদন সাপেক্ষে।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>হিসাব ও নিরীক্ষা</h6>
                                <ul>
                                    <li>আর্থিক হিসাব পদ্ধতি বাংলাদেশ সমবায় আইন ও সংশ্লিষ্ট নিয়মাবলী অনুযায়ী।</li>
                                    <li>হিসাব বছরের শেষ: ৩০শে জুন; AGM-এর পূর্বে নিরীক্ষা সম্পন্ন হবে।</li>
                                    <li>নিরীক্ষক নিয়োগ নির্বাহী কমিটি করবে; যোগ্যতা সমবায় আইন অনুযায়ী।</li>
                                    <li>প্রতিটি সদস্যের শেয়ার, আমানত, লাভ ও লেনদেনের তথ্য সফটওয়্যারে ও পাসবুকে সংরক্ষিত থাকবে।</li>
                                    <li>সব শেয়ার লেনদেন হিসাব অফিসার ও কোষাধ্যক্ষের যৌথ স্বাক্ষরে অনুমোদিত হবে।</li>
                                    <li>প্রতিটি লেনদেনের পর কোষাধ্যক্ষ কর্তৃক স্বাক্ষরিত সিস্টেম জেনারেটেড মানি রশিদ সংরক্ষণ করতে হবে।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>সদস্যপদ বাতিল</h6>
                                <ul>
                                    <li>সমিতির নিয়মাবলী লঙ্ঘন বা সমিতির ক্ষতি করলে সদস্যপদ বাতিল হতে পারে।</li>
                                    <li>মাসিক জমা নির্দিষ্ট সময়ে না দিলে ও ৩ মাসের বেশি বকেয়া থাকলে।</li>
                                    <li>ঋণ পরিশোধে বিলম্ব/অসদাচরণ; নির্ধারিত সময়ে ঋণ পরিশোধ না করলে।</li>
                                    <li>সমিতির উদ্দেশ্য ও কার্যক্রমে বাধা সৃষ্টি বা গোপনীয়তা লঙ্ঘন করলে।</li>
                                    <li>সমিতির বিরুদ্ধে মিথ্যা/ক্ষতিকর তথ্য প্রচার করলে; বিরোধ সৃষ্টি করে শান্তি ও সম্প্রীতি বিঘ্নিত করলে।</li>
                                    <li>সমিতির বিরুদ্ধে আইনগত ব্যবস্থা গ্রহণ করলে।</li>
                                </ul>
                            </section>

                            <section class="mb-4">
                                <h6>আইনগত ভিত্তি</h6>
                                <ul>
                                    <li>সমিতি বাংলাদেশ সমবায় আইন, ২০০১ এবং সংশ্লিষ্ট বিধিমালা অনুযায়ী পরিচালিত হবে।</li>
                                    <li>কার্যক্রমে বাংলাদেশ সরকারের আইন ও বিধিমালা প্রযোজ্য হবে।</li>
                                    <li>বিরোধ নিষ্পত্তিতে বাংলাদেশ সরকারের আদালত প্রাধান্য পাবে।</li>
                                    <li>সমস্ত নিয়মাবলী পরিমার্জন/পরিবর্তন/সংশোধন উদ্যোক্তা ও নির্বাহী কমিটির অনুমোদন সাপেক্ষে।</li>
                                </ul>
                            </section>

                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="sig">
                                        <div>তৌফিকুল ইসলাম (Tawfiqul Islam)</div>
                                        <div>_______________________________________</div>
                                        <div>সভাপতি (President)</div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="sig">
                                        <div>মোঃ হাসিবুজ্জামান (Md. Hasibuzzaman)</div>
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
                            
                            <div class="d-flex justify-content-center mt-4">
                                <button id="goToFormBtn" class="btn btn-success btn-lg rounded-pill px-5 mx-auto" style="display:none;letter-spacing:1px;">
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
                                                <select class="form-select" id="marital_status" name="marital_status" required>
                                                    <option value="">নির্বাচন করুন</option>
                                                    <option value="single" {{ old('marital_status') == 'single' ? 'selected' : '' }}>অবিবাহিত</option>
                                                    <option value="married" {{ old('marital_status') == 'married' ? 'selected' : '' }}>বিবাহিত</option>
                                                    <option value="divorced" {{ old('marital_status') == 'divorced' ? 'selected' : '' }}>তালাকপ্রাপ্ত</option>
                                                    <option value="widowed" {{ old('marital_status') == 'widowed' ? 'selected' : '' }}>বিধবা/বিপত্নীক</option>
                                                </select>
                                            </div>
                                            <div class="mb-3" id="spouseField" style="{{ old('marital_status') == 'married' ? '' : 'display:none' }}">
                                                <label class="form-label">স্বামী/স্ত্রীর নাম (Spouse Name)</label>
                                                <input type="text" class="form-control" id="spouse_name" name="spouse_name" value="{{ old('spouse_name') }}" {{ old('marital_status') == 'married' ? 'required' : '' }}>
                                                <small class="text-muted">বিবাহিত হলে এই তথ্য দিন</small>
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
                                                <small class="text-muted">প্রতি শেয়ারের মূল্য: ২,৫০০ টাকা</small>
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

                                <!-- Account Section -->
                                <div class="form-section">
                                    <h5><i class="fas fa-user-lock me-2"></i>অ্যাকাউন্ট সেকশন (Account Section)</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">ইমেইল ঠিকানা</label>
                                                <input type="email" class="form-control" name="email" value="{{ old('email') }}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">পাসওয়ার্ড (Password)</label>
                                                <input type="password" class="form-control" name="password">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Account Details -->
                                <div class="form-section">
                                    <h5><i class="fas fa-credit-card me-2"></i>অ্যাকাউন্ট বিবরণ (Account Details)</h5>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">অ্যাকাউন্ট টাইপ</label>
                                                <select class="form-select" name="savings_product_id">
                                                    <option value="">নির্বাচন করুন</option>
                                                    {{ create_option('savings_products', 'id', 'name') }}
                                                </select>
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
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">সদস্যের স্বাক্ষর (Member Signature)</label>
                                                <input type="file" class="form-control" name="signature_image" accept="image/*">
                                                <small class="text-muted">সর্বোচ্চ ফাইল সাইজ: 2MB</small>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">ঠিকানা সনদপত্র (Address Certificate)</label>
                                                <input type="file" class="form-control" name="address_certificate_image" accept="image/*">
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            @if(session('success'))
                Swal.fire({
                    title: 'Success',
                    text: '{{ session('success') }}',
                    icon: 'success',
                    confirmButtonText: 'OK'
                });
            @endif
            @if(session('error'))
                Swal.fire({
                    title: 'Error',
                    text: '{{ session('error') }}',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
            @endif

            var agree = document.getElementById('agreeRules');
            var btn = document.getElementById('goToFormBtn');
            var rules = document.getElementById('rulesSection');
            var form = document.getElementById('registrationFormSection');
            var marital = document.getElementById('marital_status');
            var spouse = document.getElementById('spouseField');
            var spouseInput = document.getElementById('spouse_name');

            function updateBtn(){
                if(agree && agree.checked){
                    btn && (btn.style.display = 'inline-block');
                } else {
                    btn && (btn.style.display = 'none');
                }
            }

            agree && agree.addEventListener('change', updateBtn);
            updateBtn();

            btn && btn.addEventListener('click', function(e){
                e.preventDefault();
                rules && (rules.style.display = 'none');
                if(form){
                    form.style.display = 'block';
                    form.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            });

            function toggleSpouse(){
                if(!marital || !spouse) return;
                var show = marital.value === 'married';
                spouse.style.display = show ? '' : 'none';
                if(spouseInput){
                    if(show){
                        spouseInput.setAttribute('required','required');
                    } else {
                        spouseInput.removeAttribute('required');
                        spouseInput.value = spouseInput.value; // keep value if hidden
                    }
                }
            }
            marital && marital.addEventListener('change', toggleSpouse);
            toggleSpouse();
        });
    </script>
</body>
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
