<script setup>
import NavMenu from '../Pages/Components/NavMenu.vue';
import { ref } from 'vue';
import { useForm, router } from '@inertiajs/vue3';
import { useToast } from 'vue-toastification';

const toast = useToast();

const form = useForm({
  name: '',
  email: '',
  subject: '',
  message: '',
});

const submit = () => {
  router.post('/contact', form, {
    onSuccess: () => {
      toast.success('Message sent successfully!');
      form.reset();
    },
    onError: () => {
      toast.error('Failed to send message.');
    },
  });   
};
</script>

<template>
    <NavMenu/>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card shadow">
          <div class="card-header bg-primary text-white text-center">
            <h4>Contact Us</h4>
          </div>
          <div class="card-body">
            <form @submit.prevent="submit">
              <div class="mb-3">
                <label class="form-label">Name</label>
                <input
                  type="text"
                  v-model="form.name"
                  class="form-control"
                  placeholder="Your full name"
                  required
                />
                <div v-if="form.errors.name" class="text-danger small mt-1">{{ form.errors.name }}</div>
              </div>

              <div class="mb-3">
                <label class="form-label">Email</label>
                <input
                  type="email"
                  v-model="form.email"
                  class="form-control"
                  placeholder="you@example.com"
                  required
                />
                <div v-if="form.errors.email" class="text-danger small mt-1">{{ form.errors.email }}</div>
              </div>

              <div class="mb-3">
                <label class="form-label">Subject</label>
                <input
                  type="text"
                  v-model="form.subject"
                  class="form-control"
                  placeholder="Message subject"
                  required
                />
                <div v-if="form.errors.subject" class="text-danger small mt-1">{{ form.errors.subject }}</div>
              </div>

              <div class="mb-3">
                <label class="form-label">Message</label>
                <textarea
                  v-model="form.message"
                  rows="5"
                  class="form-control"
                  placeholder="Write your message here..."
                  required
                ></textarea>
                <div v-if="form.errors.message" class="text-danger small mt-1">{{ form.errors.message }}</div>
              </div>

              <div class="d-grid">
                <button type="submit" class="btn btn-success">
                  Send Message
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<style scoped>
</style>