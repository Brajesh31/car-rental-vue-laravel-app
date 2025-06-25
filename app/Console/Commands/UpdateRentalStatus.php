<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Rental;
use Carbon\Carbon;

class UpdateRentalStatus extends Command
{
    protected $signature = 'rental:update-status';
    protected $description = 'Update rental statuses daily based on current date';

    public function handle()
    {
        $today = now()->startOfDay();

        $rentals = Rental::whereIn('status', ['Pending', 'Confirmed'])->get();

        foreach ($rentals as $rental) {
            if ($rental->status === 'Pending' && $rental->start_date->lessThanOrEqualTo($today)) {
                $rental->status = 'Cancelled';
                $rental->save();
                // Add email notification if needed
            } elseif ($rental->status === 'Confirmed' && $rental->end_date->lt($today)) {
                $rental->status = 'Completed';
                $rental->save();
                // Add email notification if needed
            }
        }

        $this->info('Rental statuses updated successfully.');
    }
}
