## Overview

* Create a public landing page inspired by cpssl.com and serve it at `/`.

* Stop redirecting unauthenticated visitors to `/login` by updating routing.

* Keep existing auth flows intact while exposing a non-auth homepage.

## Research Findings

* Root route currently forces redirect to login: `routes/web.php:57–59`.

* Auth routes are explicitly defined and can remain unchanged.

## Implementation Steps

### 1) Routing

* Edit `routes/web.php` within the `install` middleware group:

  * Replace the current root redirect with a public view:

  ```php
  Route::get('/', function () { return view('landing'); });
  ```

* Keep `login`, `register`, and other auth routes as-is.

### 2) View

* Add `resources/views/landing.blade.php` with a lightweight, responsive layout using existing assets (`backend/plugins/bootstrap/css/bootstrap.min.css`, `backend/assets/css/styles.css`).

* Sections:

  * Hero: Headline, subtext, primary CTA (e.g., “Get Started” → `/login`).

  * About: Brief company description and value proposition.

  * Services/Products: Cards grid with icons and short descriptions.

  * Clients/Trust: Logos or badges (placeholder images), short social proof.

  * Contact/CTA: Email/phone placeholders and a CTA linking to `/login`.

* Header: Brand name on the left, navigation links (`Home`, `Services`, `Contact`, `Sign In`).

* Footer: Copyright and quick links.

### 3) Assets

* Reuse existing CSS/JS already referenced in `layouts/app.blade.php` to avoid adding new libraries. Link via `asset('backend/...')` so paths resolve without `public/`.

* Images: Use `uploads/media/...` paths without the `public/` prefix to match recent asset fixes.

### 4) Content

* Placeholder copy aligned to a corporate power systems provider:

  * Headlines: “Reliable Power Systems & Solutions”, “Sustainable, Innovative, Friendly”.

  * Services: “UPS Systems”, “Industrial Batteries”, “Power Management”, “Maintenance & Support”.

  * CTA: “Sign In” to access the dashboard.

* Replace placeholders with your actual branding once provided.

### 5) Verification

* Clear view cache: `php artisan view:clear`.

* Open `http://127.0.0.1:8000/` and confirm the landing page loads without redirect.

* Test `Login` link navigates to `/login` and auth still works.

## Notes

* This introduces one new Blade view file and a minimal route change; no controllers required.

* No changes to database or auth logic.

* If you prefer a controller, we can add \`LandingController\@index

