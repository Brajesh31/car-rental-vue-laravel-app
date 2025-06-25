<?php
namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RentalStatusUpdated extends Notification implements ShouldQueue
{
    use Queueable;

    protected $rental;
    protected $newStatus;

    public function __construct($rental, $newStatus)
    {
        $this->rental = $rental;
        $this->newStatus = $newStatus;
    }

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->subject('Rental Status Updated')
                    ->greeting('Hello ' . $notifiable->name . ',')
                    ->line("Your rental (Car: {$this->rental->car->name}) has been updated to **{$this->newStatus}**.")
                    ->line("Start Date: {$this->rental->start_date}")
                    ->line("End Date: {$this->rental->end_date}")
                    ->action('View Your Rentals', url('/listRentals'))
                    ->line('Thank you for using our car rental service!');
    }
}
