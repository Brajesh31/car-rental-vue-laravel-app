<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use App\Mail\CarBookingCancellation;
use Illuminate\Queue\SerializesModels;

class CarBookingConfirmation extends Mailable
{
    use Queueable, SerializesModels;

    public $booking;

    public function __construct($booking)
    {
        $this->booking = $booking;
    }

    public function build()
    {
        return $this->subject('Car Booking is confirmation from SwiftRide')
                    ->view('emails.car_booking_confirmation');
    }
}
