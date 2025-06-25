<script setup>
import { router, usePage } from '@inertiajs/vue3';
import { ref } from "vue";
import { useToast } from "vue-toastification";
import LayOut from '../Pages/Components/LayOut.vue';
import CarDetailsComponent from './Components/CarDetailsComponent.vue';
import RentalList from './Rentals/RentalList.vue';


const activeTab = ref('section1');

const page = usePage();
const toast = useToast();

const items = ref(page.props.users);
const cars = ref(page.props.cars);
const rentals = ref(page.props.rentals);

// Function to handle editing a specific user
const edit = (userId) => {
    router.visit(`/user/edit/${userId}`, {
        onSuccess: () => {
            toast.success("Redirected to edit page.");
        },
        onError: () => {
            toast.error("Failed to redirect.");
        }
    });


};

// deleting a specific user
const deleteUser = (userId) => {
    router.delete(`/user/delete/${userId}`, {
        preserveScroll: true,
        onSuccess: () => {
            toast.success("User deleted successfully.");
            router.reload(); // reloads current page and fetches fresh data
        },
        onError: () => {
            toast.error("Failed to delete user.");
        }
    });
};
</script>

<template>
    <LayOut />
    <div class="container w-75 mt-3">
        <div class="row">
            <h1 class="text-secondary text-center">Welcome to your Dashboard- <span class="text-primary">{{
                $page.props.auth.user.name }}</span> </h1>
            <h3 class="text-danger text-center mb-3">You can edit almost every details from here</h3>

              <div class="container mt-4">
    <!-- Tab Navigation -->
    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a 
          class="nav-link" 
          :class="{ active: activeTab === 'section1' }"
          @click.prevent="activeTab = 'section1'"
          href="#"
        >
User details        </a>
      </li>
      <li class="nav-item">
        <a 
          class="nav-link" 
          :class="{ active: activeTab === 'section2' }"
          @click.prevent="activeTab = 'section2'"
          href="#"
        >
          Car Details
        </a>
      </li>
      
    </ul>

    <!-- Tab Content -->
    <div class="tab-content border border-top-0 p-4">
      <div v-if="activeTab === 'section1'">
        <h3>All User details</h3>
       <table class="table border border-2">
                <thead>
                    <tr class="text-primary">
                        <th class="border">Name</th>
                        <th class="border">Email</th>
                        <th class="border">Role</th>
                        <th class="border">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in items" :key="user.id">
                        <td class="border text-primary">{{ user.name }}</td>
                        <td class="border text-warning">{{ user.email }}</td>
                        <td class="border text-success">{{ user.role }}</td>
                        <td class="border">
                            <button @click="edit(user.id)" class="btn btn-warning m-1">Edit</button>
                        <button 
  @click="deleteUser(user.id)" 
  class="btn btn-danger m-1"
  :disabled="user.role === 'admin'"
>
  Delete
</button>

                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>      </div>
      <div v-if="activeTab === 'section2'">
        <h3>All Car Details</h3>
<div>
  <CarDetailsComponent/>
</div>
      </div>
     
    </div>
  </div>


    

</template>

<style scoped>

</style>
