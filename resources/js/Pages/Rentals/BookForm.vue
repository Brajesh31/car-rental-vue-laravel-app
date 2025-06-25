<script setup>
import { ref, watch } from 'vue'
import { Link, router, usePage } from '@inertiajs/vue3'
import NavMenu from '../Components/NavMenu.vue'
import { useToast } from "vue-toastification";

// const flash = computed(() => usePage().props.flash);

const toast = useToast();
const booked = ref(false);
const props = defineProps({
  car: Object,
  carId: Number,
})

const startDate = ref('')
const endDate = ref('')
const available = ref(null)
const totalCost = ref(null)

// CSRF token from Laravel
const csrfToken = document.querySelector('meta[name="csrf-token"]')?.content
const checkAvailability = async () => {
  if (startDate.value && endDate.value) {
    //checking the data passed from carID
    //     console.log('Sending check availability with:', {
    //   car_id: props.car.id,
    //   start_date: startDate.value,
    //   end_date: endDate.value,
    // })
    const res = await fetch('/check-availability', {

      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': csrfToken,
      },
      body: JSON.stringify({
        car_id: props.car.id,
        start_date: startDate.value,
        end_date: endDate.value,
      }),


    })

    const data = await res.json()
    available.value = data.available
    totalCost.value = data.total_cost
  }
}
const rentCar = () => {
  if (!available.value) {
      flash.toast.error("Failed to book the car.")
    return
  }

  router.post(`/cars/${props.car.id}/book`, {
    onSuccess: () => {
      flash.toast.success("Car booking Success.")
      booked.value = true // ✅ update state
    },
    onError: () => {
      flash.toast.error("Failed to book the car.")
    },
    car_id: props.car.id,
    start_date: startDate.value,
    end_date: endDate.value,
    total_cost: totalCost.value,
  })
}

</script>

<template>
  <NavMenu />
  <div class="container-fluid vh-100">
    <div class="row h-100">
      <!-- Left Side: Image -->
      <div class="col-md-6 d-flex align-items-center justify-content-center  bg-dark">
        
        <img :src="'http://127.0.0.1:8000/storage/' + car.image" alt="Car Image" class="img-fluid rounded shadow" />
        <!-- <div v-else class="text-muted">No image available</div> -->
      </div>
      <!-- Right Side: Car Details -->
      <div class="col-md-6 d-flex-reverse align-items-center justify-content-center bg-light">
        <h2 class="mb-4">{{ car.name }}</h2>
        <ul class="list-group">
          <li class="list-group-item">
            <strong>Brand:</strong> {{ car.brand }}
          </li>
          <li class="list-group-item">
            <strong>Model:</strong> {{ car.model }}
          </li>
          <li class="list-group-item">
            <strong>Year:</strong> {{ car.year }}
          </li>
          <li class="list-group-item">
            <strong>Car Type:</strong> {{ car.car_type }}
          </li>
          <li class="list-group-item">
            <strong>Daily Rent:</strong> ${{ car.daily_rent_price }}
          </li>
          <li class="list-group-item">
            <strong>Available:</strong> {{ car.availability ? 'Yes' : 'No' }}
          </li>
          <li class="list-group-item">
            <div>
              <label for="Start_Date">From</label>
              <input class="date_picker" id="Start_Date" type="date" v-model="startDate" :key="car.id"
                @change="checkAvailability" />
              <label for="End_Date">Till</label>
              <input class="date_picker" id="End_Date" type="date" v-model="endDate" :key="car.id"
                @change="checkAvailability" />

              <div v-if="available === false" class="text-danger">Car unavailable for these dates.</div>
              <div v-if="available && totalCost" class="text-success p-2 ">Total Rent: ${{ totalCost }}</div>

              <button @click="rentCar" :disabled="!available || booked" :class="[
                'px-4 py-2 ms-1 rounded',
                booked ? 'btn btn-success text-white' : 'btn btn-secondary text-white'
              ]">
                {{ booked ? 'Car Booked' : 'Book Now' }}
              </button>
            </div>
          </li>

        </ul>
      </div>
    </div>

  </div>
</template>


<style scoped>
.card {
  position: absolute !important;
  top: 15%;
  left: 40%;
}

div h2 {
  text-transform: capitalize;
  margin: 20% 1%;
  padding: 5px 5px;
}

input {
  margin: 10px;
}

label {
  margin: 2px;
  font-weight: bold;
}

.date_picker:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  transform: translateY(-4px);
  transition: 0.3s ease;
}

.shadow:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  transform: translateY(-4px);
  transition: 0.3s ease;
}
</style>