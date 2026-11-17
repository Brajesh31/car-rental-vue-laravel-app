# 🧪 Local Request Examples

These examples use dummy data and local URLs. They are not instructions to use real customer data.

## Check availability

~~~http
POST http://localhost:8000/check-availability
Accept: application/json
Content-Type: application/json

{
  "car_id": 1,
  "start_date": "2026-12-10",
  "end_date": "2026-12-12"
}
~~~

Current controller returns `available: false` on conflict or `available: true` and `total_cost` when no conflict is found. The amount is informational; the booking action currently persists the amount sent by the browser, which is a security defect.

## Create a booking

~~~http
POST http://localhost:8000/cars/1/book
Accept: text/html
Content-Type: application/x-www-form-urlencoded

car_id=1&start_date=2026-12-10&end_date=2026-12-12&total_cost=1500
~~~

Do not use this sample to test against a production system. The server must be fixed to recalculate price and prevent concurrent date conflicts before actual booking use.

## Authentication
The app uses Laravel session login rather than JWT bearer tokens. Login is a web POST form at `/login`. Follow Laravel's CSRF requirements after the current global exemption is removed.

## Safe examples
- Use `example.test` emails and dummy phone numbers.
- Never paste session cookies, APP_KEY values, passwords, database rows, or real booking addresses into docs or issues.
- Verify route names and request fields against current Vue pages and controller validation.
