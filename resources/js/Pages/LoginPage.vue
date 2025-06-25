<script setup>
import { Link, useForm, usePage } from  '@inertiajs/vue3';
import { computed } from "vue";
import { useToast } from "vue-toastification";
import NavMenu from './Components/NavMenu.vue'
const flash = computed(() => usePage().props.flash);
const toast = useToast();

const form = useForm({
    email: "",
    password: "",
});
const signUp=()=>{
    form.get("/user/create",{
    onSuccess: () => {
            flash.value.success && toast.success(flash.value.success);
            flash.value.error && toast.error(flash.value.error);
        },
    });

    
}

const login = () => {
    form.post("/login", {
        onSuccess: () => {
            flash.value.success && toast.success(flash.value.success);
            flash.value.error && toast.error(flash.value.error);
        },
    });
};
</script>

<template>

    <NavMenu/>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div
                    class="login d-flex-row justify-content-center"
                >
                    <div class="card -center border border-info border-2 mt-3" style="width: 20rem">
                        <div class="card-body">
                            <h3 class="card-title text-center">Login Here</h3>
                            

                            <form @submit.prevent="login">
                                <label class="m-1" for="email">Email:</label>
                                <input
                                class="mb-2"
                                    type="email"
                                    id="email"
                                    placeholder="Type your email"
                                    v-model="form.email"
                                />
                                <div v-if="form.errors.name">{{ form.errors.email }}</div>

                                <label class="m-1"  for="password">Password:</label>
                                <input
                                class="mb-3" 
                                    type="password"
                                    id="password"
                                    placeholder="Type your password"
                                    v-model="form.password"
                                />
                                <button class="btn btn-primary m-2 pt-2">Login</button>
                            </form>
                            <button class="btn btn-warning m-1">
                                <Link href="/user/create" class="card-link"
                                    >Not a User? Create now</Link
                                >
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.card{
    position: absolute!important;
    top:30%;
    left:40%;
}
.card form label{
    padding: 2px 2px;
    display: flex;
}
.card form input{
    display: flex;
    border: 1px solid rgb(8, 42, 43);
    border-radius: 8px;
    padding: 5px 8px;
    width: 100%;
}
</style>
