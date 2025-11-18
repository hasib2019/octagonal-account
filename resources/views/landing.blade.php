<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Power Systems & Solutions</title>
    <link rel="stylesheet" href="{{ asset('backend/plugins/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('backend/assets/css/styles.css') }}">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-white border-bottom">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/">Power Systems</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav" aria-controls="nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="#create-account">Create Account</a></li>
                    <li class="nav-item"><a class="btn btn-primary ml-lg-3" href="{{ url('login') }}">Sign In</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="py-5 bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-7">
                    <h1 class="display-5 mb-3">Reliable Power Systems & Solutions</h1>
                    <p class="lead mb-4">Sustainable, innovative, and friendly services delivering uninterrupted power for enterprises and industries.</p>
                    <a href="{{ url('login') }}" class="btn btn-primary btn-lg">Get Started</a>
                </div>
                <div class="col-md-5 text-center">
                    <img class="img-fluid" src="{{ asset('uploads/media/logo.png') }}" alt="Logo">
                </div>
            </div>
        </div>
    </header>

    <section id="services" class="py-5">
        <div class="container">
            <div class="text-center mb-4">
                <h2>Services</h2>
                <p class="text-muted">End-to-end solutions tailored to your power needs.</p>
            </div>
            <div class="row">
                <div class="col-md-3 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">UPS Systems</h5>
                            <p class="card-text">High-availability uninterrupted power supply solutions.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Industrial Batteries</h5>
                            <p class="card-text">Durable batteries engineered for mission-critical operations.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Power Management</h5>
                            <p class="card-text">Monitoring and optimization for energy efficiency.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Maintenance & Support</h5>
                            <p class="card-text">Comprehensive service, repairs, and lifecycle support.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="create-account" class="py-5 bg-light">
        <div class="container">
            <div class="text-center mb-4">
                <h2>Create Account</h2>
                <p class="text-muted">Open a savings account by submitting your details.</p>
            </div>

            @if(Session::has('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if($errors && $errors->any())
            <div class="alert alert-danger">
                <ul class="m-0">
                    @foreach($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif

            <form method="post" action="{{ url('open-account') }}" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" name="first_name" class="form-control" value="{{ old('first_name') }}" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" name="last_name" class="form-control" value="{{ old('last_name') }}" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" value="{{ old('email') }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Country Code</label>
                            <select class="form-control" name="country_code">
                                <option value="">Country Code</option>
                                @foreach(get_country_codes() as $key => $value)
                                <option value="{{ $value['dial_code'] }}" {{ old('country_code') == $value['dial_code'] ? 'selected' : '' }}>{{ $value['country'].' (+'.$value['dial_code'].')' }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Mobile</label>
                            <input type="text" name="mobile" class="form-control" value="{{ old('mobile') }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Branch</label>
                            <select class="form-control" name="branch_id">
                                <option value="">{{ get_option('default_branch_name', 'Main Branch') }}</option>
                                {{ create_option('branches', 'id', 'name') }}
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" name="city" class="form-control" value="{{ old('city') }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>State</label>
                            <input type="text" name="state" class="form-control" value="{{ old('state') }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Zip</label>
                            <input type="text" name="zip" class="form-control" value="{{ old('zip') }}">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Address</label>
                            <textarea name="address" class="form-control">{{ old('address') }}</textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Permanent Address</label>
                            <textarea name="permanent_address" class="form-control">{{ old('permanent_address') }}</textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Photo</label>
                            <input type="file" name="photo" class="form-control">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>NID Image</label>
                            <input type="file" name="nid_image" class="form-control">
                        </div>
                    </div>

                    <div class="col-12"><hr></div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Account Number</label>
                            <input type="text" name="account_number" class="form-control" value="{{ old('account_number') }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Account Type</label>
                            <select class="form-control" name="savings_product_id">
                                <option value="">Select One</option>
                                {{ create_option('savings_products', 'id', 'name') }}
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Opening Balance</label>
                            <input type="text" name="opening_balance" class="form-control" value="{{ old('opening_balance') }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Credit Source</label>
                            <input type="text" name="credit_source" class="form-control" value="{{ old('credit_source') }}">
                        </div>
                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <section id="about" class="py-5 bg-light">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h2>About Us</h2>
                    <p>We provide sustainable, innovative, and friendly power solutions enabling businesses to operate with confidence. Our expertise spans design, deployment, and support of critical power infrastructure.</p>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-6 mb-3"><div class="p-3 border rounded text-center">Sustainable</div></div>
                        <div class="col-6 mb-3"><div class="p-3 border rounded text-center">Innovative</div></div>
                        <div class="col-6"><div class="p-3 border rounded text-center">Friendly</div></div>
                        <div class="col-6"><div class="p-3 border rounded text-center">Reliable</div></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="contact" class="py-5">
        <div class="container">
            <div class="text-center mb-4">
                <h2>Contact</h2>
                <p class="text-muted">Get in touch to discuss your requirements.</p>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                    <p class="mb-2">Email: info@example.com</p>
                    <p class="mb-4">Phone: +000 000 0000</p>
                    <a href="{{ url('login') }}" class="btn btn-outline-primary">Sign In</a>
                </div>
            </div>
        </div>
    </section>

    <footer class="py-4 bg-white border-top">
        <div class="container text-center">
            <small>© {{ date('Y') }} Power Systems & Solutions</small>
        </div>
    </footer>

    <script src="{{ asset('backend/assets/js/vendor/jquery-3.6.1.min.js') }}"></script>
    <script src="{{ asset('backend/plugins/bootstrap/js/bootstrap.min.js') }}"></script>
</body>
</html>