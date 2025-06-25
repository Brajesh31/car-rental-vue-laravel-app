<script setup>
import { Link, router, useForm, usePage } from '@inertiajs/vue3';
import { computed, onMounted, ref } from "vue";
import { useToast } from "vue-toastification";

const page = usePage();
const flash = computed(() => usePage().props.flash);
const toast = useToast();

const props = defineProps({
  car: Object
});

const car = computed(() => page.props.car);

// Form with default structure
const form = useForm({
    name: '',
    brand: '',
    model: '',
    year: '',
    car_type: '',
    image: null,
    daily_rent_price: '',
    availability: '',
});

const imagePreview = ref(null); // for new preview
const existingImageUrl = computed(() => car.value?.image_url || null); // set this based on your backend setup


// Populate form safely using defaults and reset
onMounted(() => {
    if (car.value) {
        form.defaults({
            name: car.value.name,
            brand: car.value.brand,
            model: car.value.model,
            year: car.value.year,
            car_type: car.value.car_type,
            daily_rent_price: car.value.daily_rent_price,
            availability: car.value.availability,
            image: null, // don't prefill image field for file input
        });
        form.reset();
    }
});

function update() {

  form.post(`/cars/${car.value.id}/update`, {
    forceFormData: true, // for handling file upload
    _method: 'put',
    onSuccess: () => {
      flash.value.success && toast.success(flash.value.success);
      flash.value.error && toast.error(flash.value.error);
    },
  });
}

const handleImage = (event) => {
    const file = event.target.files[0];
    if (file) {
        form.image = file;

        const reader = new FileReader();
        reader.onload = (e) => {
            imagePreview.value = e.target.result;
        };
        reader.readAsDataURL(file);
    }
}
</script>


<template>

    <div class="container">
        <div class="card -center border border-info border-2 mt-3" style="width: 20rem">
            <div class="card-body">
                <h3 class="card-title text-center">Edit Car Details</h3>


                <form @submit.prevent="update" enctype="multipart/form-data">
                <!-- <form @submit.prevent="update"> -->
                    <label class="m-1" for="name">Name:</label>
                    <input class="mb-2" type="text" id="name" placeholder="Cars Name" v-model="form.name" />
                    <div v-if="form.errors.name">{{ form.errors.name }}</div>

                    <label class="m-1" for="brand">Brand:</label>
                    <input class="mb-2" type="text" id="brand" placeholder="What is Brand" v-model="form.brand" />
                    <label class="m-1" for="model">Model:</label>
                    <input class="mb-2" type="text" id="model" placeholder="What is the model" v-model="form.model" />

                    <label class="m-1" for="year">Year:</label>
                    <input class="mb-3" type="text" id="year" placeholder="Year" v-model="form.year" />

                    <label class="m-1" for="car_image">Image:</label>
                    <input class="mb-3" type="file" id="car_image" @change="handleImage" />

                    <label class="m-1" for="car_type">Car Type:</label>
                    <input class="mb-3" type="text" id="car_type" v-model="form.car_type"
                        placeholder="Type of the Car" />

                    <label class="m-1" for="daily_rent_price">Daily Rent Price:</label>
                    <input class="mb-3" type="number" id="daily_rent_price" v-model="form.daily_rent_price"
                        placeholder="Rent of the Car" />

                    <label class="m-1" for="availability">Availability:</label>
                    <input class="mb-3" type="text" id="availability" v-model="form.availability"
                        placeholder="Is it available" />

                    <button class="btn btn-primary m-2 pt-2" :disabled="form.processing">Update the Car</button>
                </form>
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