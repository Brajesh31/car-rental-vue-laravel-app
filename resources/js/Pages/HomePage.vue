<script setup>

import { Link } from '@inertiajs/vue3';
import LayOut from '../Pages/Components/LayOut.vue';
const props = defineProps({
  flash: Object
});
</script>

<template>
    
  <LayOut/>
  <div class="container fluid">
        <div class="d-flex ">
            
            <div >
                <img src="/public/images/hero-banner.png" alt="SwiftRide Hero" class=" img-fluid w-100 rounded" />
 
  </div>
 <div class="d-flex justify-content-center align-items-center" style="height: 70vh;">
  
<button class="btn btn-warning ms-5 p-5 ">
  <Link class="nav-link fs-2 nav-anim" href="/rentals/create"
                            >Browse for a Car</Link>
</button>

                        
</div>


    </div>
    </div>
    
</template>

<style scoped>
Link{
  link-style-type:none;
}
</style>