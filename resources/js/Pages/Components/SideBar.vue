<script setup>
import { Offcanvas } from 'bootstrap';
import { onMounted, ref } from 'vue';

let bsOffcanvas = null;
const offcanvasRef = ref(null);


onMounted(() => {
  bsOffcanvas = new Offcanvas(offcanvasRef.value);
});


</script>

<template>



  <button  class="btn rotate-hover-btn bg-transparent" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample"
    aria-controls="offcanvasExample">
      <img class="img-fluid rotate-image sideBar rotate-hover " src="/public/images/SideBarImage.png"/>

  </button>

  <div ref="offcanvasRef" class="offcanvas offcanvas-start " tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title" id="offcanvasExampleLabel"> </h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <div>
      </div>
      <div class="dropdown mt-3">
        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
          Dashboard menu
        </button>
        <ul class="dropdown-menu nav-anim">
          <li><a class="dropdown-item nav-anim" href="/listCars">Cars only</a></li>
          <li><a class="dropdown-item nav-anim" href="#">Total Dashboard</a></li>
          <li><a class="dropdown-item nav-anim" href="#">Settings</a></li>
        </ul>
      </div>
    </div>
  </div>
</template>

<style scoped>
img {
height: 80px;
width: auto;
}
.sideBar{
  position: fixed;
  left: 0%;
  top: 45%;
}

.rotate-image {
  transform: rotate(-90deg);
  transition: transform 0.5s ease-in-out;
}

.rotate-hover:hover {
  transform: rotate(90deg);
  transition: transform 0.3s ease-in-out;
}
.nav-anim:hover {
    color: #f00961 !important;
    text-shadow: #022410;
padding-left: 1px;
font-weight: bolder;
}

</style>