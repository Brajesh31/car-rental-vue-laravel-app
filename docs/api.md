# Routes and API behavior

## How requests work

The application uses Laravel web routes and Inertia page responses. It does not expose a separately versioned REST API. Vue forms generally submit through Inertia; the availability checker is a direct JSON request.

Route definitions and middleware are in routes/web.php.

## Public routes

| Method | Path | Controller behavior |
| --- | --- | --- |
| GET | / | Renders HomePage |
| GET | /about | Renders AboutPage |
| GET | /contact | Renders the Contact page |
| GET | /login | Renders LoginPage |
| POST | /login | Validates email/password and calls Laravel Auth::attempt |
| GET | /user/create | Renders SignupPage |
| POST | /user/create | Creates a user using request name, email, role, and password |

Signup accepts the role from the public request and does not constrain it to a safe customer role. This must be fixed before public account creation is enabled.

## Admin routes

These paths are inside auth and RoleMiddleware:admin:

| Method | Path | Purpose |
| --- | --- | --- |
| GET | /user/edit/{id} | Render a user edit form |
| PUT | /user/update/{id} | Update user properties |
| DELETE | /user/delete/{id} | Delete a user |
| GET | /listCars | List cars for administration |
| GET | /cars/create | Render car creation form |
| POST | /cars/store | Validate and store a car and optional image |
| GET | /showCar/{car} | Render one car |
| GET | /cars/{car}/edit | Render car editor |
| POST | /cars/{car}/update | Update car data using method spoofing from Vue |
| GET | /cars/{car}/delete | Delete a car; current mutation uses GET |

## Authenticated user and admin routes

These paths use auth and RoleMiddleware:user,admin:

| Method | Path | Purpose |
| --- | --- | --- |
| GET | /dashboard | Render dashboard; controller currently loads every user and car |
| GET | /user/logout | Sign out; current mutation uses GET |
| PUT | /rentals/{id}/update-status | Attempt status update; controller checks for admin |
| GET | /listRentals | List current user's rentals or all rentals for admin |
| GET | /rentals/create | Choose a car to rent |
| GET | /cars/{car}/book | Render booking form |
| POST | /cars/{car}/book | Create a rental and send confirmation mail |
| POST | /check-availability | Return JSON availability and calculated total |
| GET | /showRental/{rental} | Route exists, controller is currently a stub |
| GET | /rentals/{rental}/edit | Route exists, controller is currently a stub |
| PUT | /rentals/{rentalId}/cancel | Mark a rental Cancelled; ownership is not checked |

The route group does not make record ownership automatic. Add policies or explicit controller checks before returning or changing a rental.

## Contact form mismatch

The Contact Vue page submits POST /contact. routes/web.php defines only GET /contact, so there is no server action for sending or storing a message.

## Booking request details

The Vue booking page sends car_id, start_date, end_date, and total_cost. The availability endpoint validates car and date fields, checks overlapping rental dates, and returns a total. The booking controller calls the availability method again but then saves the browser-supplied total_cost. The server should calculate and persist the amount itself and use a transaction or lock to prevent simultaneous conflicting bookings.

Booking confirmation mail is sent synchronously to the signed-in user's address. The environment template's log mailer records messages locally instead of delivering them.

## CSRF

bootstrap/app.php currently configures CSRF exclusions for all URIs. This is unsafe for web writes. If protection is restored, update the booking page's custom fetch request to send a valid CSRF token; the current Blade root does not include a csrf-token meta element.
