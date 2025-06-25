<script setup>
import { usePage } from '@inertiajs/vue3';
import { ref } from 'vue';
import { useToast } from 'vue-toastification';
import LayOut from '../Components/LayOut.vue';

const page = usePage();
const toast = useToast();
const cars = ref(page.props.cars || []);
</script>
<template>
  <LayOut />
<div class="d-flex flex-wrap justify-content-center gap-3 w-80">

  <!-- <div class="container d-flex flex-wrap justify-content-center mt-4 gap-4"> -->

    <div class="card" v-for="car in cars" :key="car.id" style="width: 18rem;">
      <img
        :src="`http://127.0.0.1:8000/storage/${car.image}`"
        class="card-img-top"
        :alt="car.name"
      />
    <div class="card-body">
        <h5 class="card-title">{{ car.name }}</h5>
        <p class="card-text">
          <strong>Price: </strong> ${{ car.daily_rent_price }}/day<br>
          <strong>Status: </strong>
          <span :class="car.availability ? 'text-success' : 'text-danger'">
            {{ car.availability ? 'Available' : 'Unavailable' }}
          </span>
        </p>
        <a
          v-if="car.availability"
          :href="`/cars/${car.id}/book`"
          class="btn btn-primary"
        >
          Book Now
        </a>
        <button v-else class="btn btn-secondary" disabled>Unavailable</button>
        <!-- {{ car.links() }} -->
      </div>
    </div>
  </div>
</template>

<style scoped>
.card form label {
  padding: 2px;
  display: flex;
}

.card form input {
  display: flex;
  border: 1px solid rgb(8, 42, 43);
  border-radius: 8px;
  padding: 5px 8px;
  width: 100%;
}
.card-title {
  text-transform: capitalize;
}
.card-img-top {
  height: 180px;
  object-fit: cover;
}

.card:hover {
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
  transform: translateY(-4px);
  transition: 0.3s ease;
}


.card {
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

</style>
