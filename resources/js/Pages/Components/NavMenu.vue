<script setup>
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { computed } from "vue";
import { useToast } from "vue-toastification";
const flash = computed(() => usePage().props.flash);
const toast = useToast();
let page = usePage;
const props = defineProps({
    email: String,
    name: String,
    success: String,
});
</script>

<template>
    <!-- <nav class="navbar navbar-expand-lg bg-success-subtle shadow-sm custom-font"> -->
    <nav class="navbar navbar-expand-lg gradient-success shadow-sm custom-font">
        <div class="container-fluid">
            <a class="navbar-brand d-flex align-items-center" href="#">
                <img src="/public/images/logo-swiftride.png" alt="SwiftRide logo" width="90" class="me-2 rounded" />
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <Link class="nav-link fs-5 nav-anim active" href="/">Home</Link>
                    </li>
                    <li class="nav-item">
                        <Link class="nav-link fs-5 nav-anim" href="/rentals/create">Rent A Car</Link>
                    </li>
                   
                    <li class="nav-item" >
                        <Link  class="nav-link fs-5 nav-anim" href="/listRentals">Rental History</Link>
                    </li>
                     <li  class="nav-item">
                        <Link   class="nav-link fs-5 nav-anim" href="/dashboard">Dashboard</Link>
                    </li>


                    <li class="nav-item">
                        <Link class="nav-link fs-5 nav-anim" href="/contact">Contact Us</Link>
                    </li>
                    <li v-if="$page.props.auth.user != null" class="nav-item">
                        <Link class="nav-link fs-5 nav-anim" href="/user/logout">
                        Hi, {{ $page.props.auth.user.name }} click to
                        Logout!
                        </Link>
                    </li>
                    <li class="nav-item" v-else>
                        <Link class="nav-link fs-5 nav-anim" href="/login">
                        Login Here
                        </Link>
                    </li>
                </ul>
                <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                    <button class="btn btn-outline-success" type="submit">
                        Search
                    </button>
                </form>
            </div>
        </div>
    </nav>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

.custom-font {
    font-family: "Poppins", sans-serif;
}

.gradient-success {
    background: linear-gradient(to right,
            #2eb2f8,
            #ffffff);
    /* success green to white */
}

.nav-anim {
    position: relative;
    transition: color 0.4s ease;
}

.nav-anim::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    height: 2px;
    width: 0%;
    background-color: #1a24e7;
    transition: width 0.3s ease-in-out;
}

.nav-anim:hover::after {
    width: 100%;
}

.nav-anim:hover {
    color: #900af7 !important;
    text-shadow: #022410;
    padding: 3px;

}
</style>
