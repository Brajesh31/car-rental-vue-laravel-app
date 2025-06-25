<script setup>
import { useForm, usePage } from '@inertiajs/vue3';
import { computed, onMounted } from "vue";
import { useToast } from "vue-toastification";

const page = usePage();
const flash = computed(() => page.props.flash);
const toast = useToast();

// Get user data from page props (assumes controller passes user info)
const user = computed(() => page.props.user);

// Initialize form with user data

const form = useForm({
  name: '',
  email: '',
  role: '',
  password: '',
  password_confirmation: '', // Required for confirmation
});

// Populate form on mount
onMounted(() => {
    if (user.value) {
        form.name = user.value.name;
        form.email = user.value.email;
        form.role = user.value.role;
    }
});

const updateUser = () => {
    form.put(`/user/update/${user.value.id}`, {
        onSuccess: () => {
            if (flash.value.success) toast.success(flash.value.success);
            if (flash.value.error) toast.error(flash.value.error);
            form.reset("password", "confirmPassword"); 
        },
    });
};

</script>

<template>
    <div class="container">
        <div class="card -center border border-info border-2 mt-3" style="width: 20rem">
            <div class="card-body">
                <h3 class="card-title text-center">Edit User Details</h3>

                <form @submit.prevent="updateUser">
                    <label class="m-1" for="name">Name:</label>
                    <input class="mb-2" type="text" id="name" placeholder="Type your name" v-model="form.name" />
                    <div v-if="form.errors.name">{{ form.errors.name }}</div>

                    <label class="m-1" for="email">Email:</label>
                    <input class="mb-2" type="email" id="email" placeholder="Type your email" v-model="form.email" />
                    <div v-if="form.errors.email">{{ form.errors.email }}</div>

                    <label class="m-1" for="password">Password:</label>
                    <input class="mb-2" type="password" id="password" placeholder="Type new password"
                        v-model="form.password" />
                    <div v-if="form.errors.password">{{ form.errors.password }}</div>

                    <label class="m-1" for="password_confirmation">Confirm Password:</label>
                    <input type="password" v-model="form.password_confirmation" placeholder="Confirm Password" />
                    <div v-if="form.errors.password_confirmation">{{ form.errors.password_confirmation }}</div>



                    <label class="m-1" for="role">Role:</label>
                    <input class="mb-2" type="text" id="role" placeholder="admin or user" v-model="form.role" />
                    <div v-if="form.errors.role">{{ form.errors.role }}</div>

                    <button class="btn btn-primary mt-3">Update User</button>
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
