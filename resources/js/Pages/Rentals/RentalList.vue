<script setup>
import { Link, router, usePage } from "@inertiajs/vue3";
import { ref, onMounted } from "vue";
import { useToast } from "vue-toastification";
import LayOut from "../Components/LayOut.vue";
import NavMenu from "../Components/NavMenu.vue";
import dayjs from "dayjs";
const page = usePage();
const toast = useToast();
const isAdmin = page.props.isAdmin;
const rentals = ref(page.props.rentals);
const user = page.props.user;
const formatDate = (date) => {
  return dayjs(date).format("YYYY-MM-DD");
};

const isCancelable = (startDate) => {
  return dayjs(startDate).isAfter(dayjs()); // returns true if startDate is in future
};

// const allRentals = ref(page.props.rentals);
const items = ref([...rentals.value]);

const selectedStatus = ref("");

const filterByStatus = () => {
  if (selectedStatus.value === "") {
    items.value = [...rentals.value];
  } else {
    items.value = rentals.value.filter(
      (r) => r.status === selectedStatus.value
    );
  }
};

//Serial counter
const slCount = 1;

// Function to handle New rental
const create = () => {
  router.get(`/rentals/create`, {
    onSuccess: () => {
      toast.success("Redirected to New rentals page.");
      router.reload(); // reloads current page and fetches fresh data
    },
    onError: () => {
      toast.error("Failed to redirect.");
    },
  });
};

// Function to handle edit a specific rental

const edit = (rental) => {
  router.visit(`/rentals/${rental}/edit`, {
    onSuccess: () => {
      toast.success("Redirected to edit page.");
    },
    onError: () => {
      toast.error("Failed to redirect.");
    },
  });
};

//check if the rental is confirmed or not
const isConfirmed = (rental) => {
  router.visit(`/showRental/${rental}`, {
    onSuccess: () => {
      toast.success("Showing the details of rental car.");
    },
    onError: () => {
      toast.error("Failed to redirect.");
    },
  });
};

// deleting a specific rental
const cancelRental = (rentalId) => {
  if (confirm("Are you sure you want to cancel this rental?")) {
    router.put(
      `/rentals/${rentalId}/cancel`,

      {
        preserveScroll: true,
        onSuccess: () => {
          toast.success("Cancelled successfully.");
        },
        onError: (errors) => {
          toast.error("Failed to cancel status.");
        },
      }
    );
  }
};
const updateStatus = (status, rental) => {
  router.put(
    `/rentals/${rental}/update-status`,
    { status: status },
    {
      preserveScroll: true,
      onSuccess: () => {
        toast.success(`Status updated to ${newStatus}`);
        router.reload();
      },
      onError: (errors) => {
        console.error(errors);
      }
    }
  );
};

//Automation of rental status pending (on starting date) and confirmed (on ending date)
// const updateRentalStatus = (id, newStatus) => {
//   router.put(
//     `rentals/${id}/update-status`,
//     { status: newStatus },
//     {
//       preserveScroll: true,
//       onSuccess: () => {

//       },
//       onError: ()  toast.success(`Status updated to ${newStatus}`);
//       router.reload(); => {
//   toast.error("Failed to update status.");
// },
//         }
//     );
// };

onMounted(() => {
  const today = dayjs().format("YYYY-MM-DD");

  rentals.value.forEach((rental) => {
    const startDate = dayjs(rental.start_date).format("YYYY-MM-DD");
    const endDate = dayjs(rental.end_date).format("YYYY-MM-DD");

    // Auto-cancel if status is Pending and today is the start date
    if (rental.status === "Pending" && startDate === today) {
      updateRentalStatus(rental.id, "Cancelled");
    }

    // Auto-complete if status is Confirmed and today is after end_date
    if (
      rental.status === "Confirmed" &&
      dayjs(today).isAfter(dayjs(endDate), "day")
    ) {
      updateRentalStatus(rental.id, "Completed");
    }
  });
});
</script>

<template>
  <NavMenu />

  <div class="container w-80 mt-3">

    <div class="row">
      <h2 class="text-warning text-center m-1">
        All your Rental history in one place
      </h2>



      <hr class="mt-1" />
<div class="row">
  <div class="col-md-12 d-flex">
     <div class="card text-center">
        <div class="card-header">
<h5 class="card-title bg-primary-subtle rounded text-primary p-2 m-1">Confirmed</h5>
        </div>
        <div class="card-body">
          <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
         
      </div>
      <div class="card text-center">
        <div class="card-header">
<h5 class="card-title bg-warning-subtle rounded text-warning p-2 m-1">Pending</h5>
        </div>
        <div class="card-body">
          <h5 class="card-title">Pending</h5>
          <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
         
      </div>
      <div class="card text-center">
        <div class="card-header">
<h5 class="card-title bg-success-subtle rounded text-success p-2 m-1">Completed</h5>
        </div>
        <div class="card-body">
          <h5 class="card-title">Special title treatment</h5>
          <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
         
      </div>
      <div class="card text-center">
        <div class="card-header">
<h5 class="card-title bg-danger-subtle rounded text-danger p-2 m-1">Cancelled</h5>
        </div>
        <div class="card-body">
          <h5 class="card-title">Special title treatment</h5>
          <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
         
      </div>
      

  </div>
</div>
     
      <h2 class="text-warning text-center m-1"></h2>

      <hr class="mt-2" />
      <table class="table border border-1">
        <thead>
          <tr class="text-primary">
            <th class="border rounded">SL</th>
            <th class="border rounded">Car Name</th>
            <th class="border rounded">Start Date</th>
            <th class="border rounded">End Date</th>
            <th class="border rounded">Total Cost ($)</th>
            <th class="border rounded">Booked by</th>
            <th class="border rounded">Status</th>
            <th class="border rounded">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(rental, index) in items" :key="rental.id">
            <td class="border rounded text-primary">
              {{ index + 1 }}
            </td>
            <td class="border rounded text-dark">
              {{ rental.car?.name || "N/A" }}
            </td>
            <td class="border rounded text-dark">
              {{ formatDate(rental.start_date) }}
            </td>
            <td class="border rounded text-dark">
              {{ formatDate(rental.end_date) }}
            </td>
            <td class="border rounded text-dark">
              {{ rental.total_cost }}
            </td>
            <td class="border rounded text-dark">
              {{ rental.user?.name ?? user.name }}
            </td>

            <!-- <td class="border rounded" :class="rental.status === 'Cancelled' ? 'text-danger' : 'text-warning'">
            
            {{ rental.status }}
              
            </td>
             -->

            <td class="border rounded" :class="{
              'text-danger light':
                rental.status.toLowerCase() === 'cancelled',
              'text-warning':
                rental.status.toLowerCase() === 'pending',
              'text-success':
                rental.status.toLowerCase() === 'completed',
              'text-primary':
                rental.status.toLowerCase() === 'confirmed',
            }">
              {{ rental.status }}
            </td>

            <td class="border rounded">
              <!-- Admin can click to change -->
              <button class="btn btn-warning m-1">
                <template v-if="isAdmin">
                  <select v-model="rental.status" @change="
                    updateStatus(
                      rental.status,
                      rental.id
                    )
                    ">
                    <option value="pending">Pending</option>
                    <option value="confirmed">
                      Confirmed
                    </option>
                    <option value="completed">
                      Completed
                    </option>
                    <option value="cancelled">
                      Cancelled
                    </option>
                  </select>
                </template>
              </button>
              <!-- <button @click="cancelRental(rental.id)" v-if="rental.start_date"
                class="btn btn-danger m-1">Cancel</button> -->
              <button :disabled="!isCancelable(rental.start_date)" :class="[
                'btn',
                'btn-danger',
                'm-1',
                {
                  'opacity-70': !isCancelable(
                    rental.start_date
                  ),
                  'cursor-not-allowed': !isCancelable(
                    rental.start_date
                  ),
                },
              ]" @click="deleteRental(rental.id)">
                Cancel
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<style scoped>
.btn:hover {
  transform: scale(1.02) rotate(3deg);
  transition: transform 0.3s ease-in-out;
  cursor: pointer;
}
</style>
