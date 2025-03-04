<template>
  <div class="container mt-4">
    <h2>Vue Bootstrap Example</h2>

    <div class="alert alert-info" v-if="message" role="alert">
      {{ message }}
    </div>

    <button class="btn btn-primary" @click="changeMessage">Click Me</button>
  </div>
</template>

<script>
import apiService from "@/services/apiService";

export default {
  data() {
    return {
      categories: [],
    };
  },

  created() {
    // this.fetchCategories();
  },

  methods: {
    fetchCategories() {
      apiService
        .get("categories")
        .then((data) => {
          this.categories = data;
        })
        .catch((error) => {
          console.error("Error fetching categories:", error);
        });
    },
  },
};
</script>

<style scoped></style>
