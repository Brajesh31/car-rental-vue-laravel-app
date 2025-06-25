<!DOCTYPE html>
<html>
<head>
    <title>Car Booking Confirmation</title>
</head>
<body>
    <h2>Dear {{ $booking->user->name }},</h2>

    <p>Thank you for cancelling it. By the see you again with us!</p>

    <p>Here are your booking cancellation details:</p>
    <ul>
        <li><strong>Car:</strong> {{ $booking->car->name }}</li>
        <li><strong>Pickup Date:</strong> {{ $booking->start_date }}</li>
        <li><strong>Return Date:</strong> {{ $booking->end_date}}</li>
        <li><strong>Total Price:</strong> ${{ $booking->total_cost }}</li>
    </ul>

    <p>We look forward to serving you. If you have any questions, feel free to contact us.</p>

    <p>Regards,<br>Car Rental Team</p>
    <p>Please call if you need any help. Thank you!</p>
    <p>Team, <br>SwiftRide</p>
</body>
</html>
