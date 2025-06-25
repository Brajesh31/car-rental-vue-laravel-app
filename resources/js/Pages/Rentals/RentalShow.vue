<script setup>
import { usePage } from '@inertiajs/vue3';
import { ref, onMounted } from 'vue';

const page= usePage();
const car = ref(null);

defineProps({ car: Object });



onMounted(() => {
  // Replace this with a prop or API call
  car.value = {
    name: page.props.value.name,
    brand: page.props.value.brand,
    model: page.props.value.model,
    year: page.props.value.year,
    car_type: page.props.value.car_type,
    daily_rent_price: page.props.value.daily_rent_price,
    availability: page.props.value.availability,
    image_url: 'storage/images/', // Make sure this path is valid
  };
});
</script>

<template>
  <div class="container-fluid vh-100">
    <div class="row h-100">
      <!-- Left Side: Image -->
      <div class="col-md-6 d-flex align-items-center justify-content-center bg-light">
        <img
          v-if="car?.image_url"
          :src="car.image_url"
          alt="Car Image"
          class="img-fluid rounded shadow"
        />
        <div v-else class="text-muted">No image available</div>
      </div>

      <!-- Right Side: Car Details -->
      <div class="col-md-6 p-5">
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

.card form label {
    padding: 2px 2px;
    display: flex;
}

.card form input {
    display: flex;
    border: 1px solid rgb(8, 42, 43);
    border-radius: 8px;
    padding: 5px 8px;
    width: 100%;
}
</style>