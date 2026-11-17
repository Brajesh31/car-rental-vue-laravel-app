# ⏱️ Scheduler and Queue Verification

## Scheduler
Laravel scheduling requires the host to invoke `php artisan schedule:run` every minute.

Current source mismatch: `routes/console.php` registers `rental:check-status`, while `UpdateRentalStatus` declares `rental:update-status`. Align those names and inspect `php artisan schedule:list` before expecting execution.

Test the command directly with a disposable DB and synthetic rentals. Check pending rentals with start dates at/before today and confirmed rentals whose end date is before today.

## Queue and mail

The local Composer dev script runs `queue:listen --tries=1`. Booking confirmation mail is sent synchronously by the current controller. If changing to queued mail, supervise workers, define retries and failure handling, and monitor failed jobs.

Never use real customer addresses in local mail examples.
