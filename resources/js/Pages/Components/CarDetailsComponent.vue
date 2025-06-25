<script setup>
import { Link, router, usePage } from '@inertiajs/vue3';
import { ref } from "vue";
import { useToast } from "vue-toastification";
const page = usePage();
const toast = useToast();
//Serial counter
const slCount = 1;

const items = ref(page.props.cars);


// Function to handle New car
const create = () => {
    router.get(`/cars/create`, {
        onSuccess: () => {
            toast.success("Redirected to New Cars page.");
            router.reload(); // reloads current page and fetches fresh data
        },
        onError: () => {
            toast.error("Failed to redirect.");
        }
    });
};

// Function to handle edit a specific car

const edit = (car) => {

    router.visit(`/cars/${car}/edit`, {
        onSuccess: () => {
            toast.success("Redirected to edit page.");
        },
        onError: () => {
            toast.error("Failed to redirect.");
        }
    });
};

//show 1 car
const showCar=(car)=> {

  router.visit(`/showCar/${car}`,{
        onSuccess: () => {
            toast.success("Showing favorite CARS.");
        },
        onError: () => {
            toast.error("Failed to redirect.");
        }
    });
};
// deleting a specific car
function deleteCar(carId) {

    if (confirm('Are you sure you want to delete this car?')) {
        router.get(`/cars/delete?id=${carId}`, {
            preserveScroll: true,

            onSuccess: () => {
                toast.success('Car deleted successfully');
                router.reload(); // reloads current page and fetches fresh data

            },
            onError: () => {
                toast.error('Ops! Failed to delete car');
            },
        });
    }
}


</script>

<template>
    <div class="container w-80 mt-3">
        <div class="row">
            

            <hr class="mt-1">
            <h2 class="text-warning text-center m-1"></h2>

            <button @click="create" class="btn btn-primary mb-3 p-2 fs-4 rounded">+ Add a new car</button>
            <hr>
            <table class="table border border-1">
                <thead>
                    <tr class="text-primary">
                        <th class="border rounded">Sl</th>
                        <th class="border rounded">Name</th>
                        <th class="border rounded">Brand</th>
                        <th class="border rounded">Model</th>
                        <th class="border rounded">Year</th>
                        <th class="border rounded">Image</th>
                        <th class="border rounded">Car Type</th>
                        <th class="border rounded">Daily Rent Price</th>
                        <th class="border rounded">Availability</th>
                        <th class="border rounded">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="car in items" :key="car.id">
                        <td class="border rounded text-primary">{{ slCount++ }}</td>
                        <td class="border rounded text-primary">{{ car.name }}</td>
                        <td class="border rounded text-dark">{{ car.brand }}</td>
                        <td class="border rounded text-dark">{{ car.model }}</td>
                        <td class="border rounded text-dark">{{ car.year }}</td>


                        <!-- <td class="border rounded text-dark d-flex justify-content-center">
                            <img :src="'storage/' + car.image" alt="Car Image" width="100" class="rounded" />
                        </td> -->
                        <td class="border rounded text-dark d-flex justify-content-center">
                            <!-- <img :src="'storage/' + car.image" alt="Car Image" width="100" class="rounded" /> -->

                            <button @click="showCar(car.id)" class="btn p-0 border-0 bg-transparent">
                                <img :src="'storage/' + car.image" alt="Show Car" class="img-fluid rounded"
                                    style="width: 120px; " 
                                />

                            </button>
                        </td>


                        <td class="border rounded text-warning">{{ car.car_type }}</td>
                        <td class="border rounded text-warning">{{ car.daily_rent_price }}</td>
                        <td class="border rounded text-warning">{{ car.availability == 1 ? "Yes" : "No" }}</td>
                        <td class="border rounded">
                            <button @click="edit(car.id)" class="btn btn-warning m-1">Edit</button>
                            <button @click="deleteCar(car.id)" class="btn btn-danger m-1">
                                Delete
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
