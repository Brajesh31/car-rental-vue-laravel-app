<script setup>
import { Link, useForm, usePage } from '@inertiajs/vue3';
import { computed, onMounted } from "vue";
import { useToast } from "vue-toastification";
// import {NavMenu} from "@/Components/NavMenu.vue";
const page = usePage();
const flash = computed(() => usePage().props.flash);
const toast = useToast();

const form = useForm({
    name: "",
    email: "",
    password: "",
    password_confirmation:"",
    role: "",
});





const create = () => {
    // console.log(form);
    form.post("/user/create", {
        onSuccess: () => {
            flash.value.success && toast.success(flash.value.success);
            flash.value.error && toast.error(flash.value.error);
            form.reset();//form reset
        },
    });
};

</script>

<template>
    <!-- <NavMenu/> -->

    <div class="container">
        <div class="card -center border border-info border-2 mt-3" style="width: 20rem">
            <div class="card-body">
                <h3 class="card-title text-center">Sign Up Here</h3>


                <form @submit.prevent="create">
                    <label class="m-1" for="name">Name:</label>
                    <input class="mb-2" type="text" id="name" placeholder="Type your Name" v-model="form.name" />
                    <div v-if="form.errors.name">{{ form.errors.name }}</div>
                    <label class="m-1" for="email">Email:</label>

                    <input class="mb-2" type="email" id="email" placeholder="Type your email" v-model="form.email" />
                    <label class="m-1" for="password">Password:</label>
                    <input class="mb-3" type="password" id="password" placeholder="Type your password"
                        v-model="form.password" />
                    <label class="m-1" for="password_confirmation">Confirm Password:</label>
                    <input class="mb-3" type="password" id="password_confirmation" v-model="form.password_confirmation"    placeholder="confirm your password" />
                    <label class="m-1" for="role">Role:</label>
                    <input class="mb-3" type="text" id="role" v-model="form.role" placeholder="admin or user" />
                    <button class="btn btn-primary m-2 pt-2">Create New User</button>
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