<script>
import apiService from "@/services/apiService";
import { useRoute } from "vue-router";

export default {
  data() {
    return {
      treatment: null,
      fullName: "",
    };
  },

  created() {
    this.fetchTreatment();
  },

  methods: {
    fetchTreatment() {
      const route = useRoute();
      const lang = navigator.language;
      // Retrieve the treatment id passed from the treatment selection component
      const treatmentId = route.params.treatment_id;
      apiService
        .get(`treatments/${treatmentId}?lang=${lang}`)
        .then((data) => {
          this.treatment = data;
        })
        .catch((error) => {
          console.error("Error fetching the selected treatment:", error);
        });
    },

    submitForm() {
      if (this.fullName) {
        // TODO: implement client treatment submission
        console.log("Full Name:", this.fullName);
        console.log("Selected Treatment:", this.treatment.name);

        // Redirect to home page
        this.$router.push("/");
      }
    },
  },
};
</script>

<template>
  <div class="container my-5">
    <div class="row mb-5">
      <div class="col text-center">
        <img src="/images/mtomady.jpg" alt="Logo" class="img-fluid logo-img" />
      </div>
    </div>

    <!-- Treatment Information -->
    <div class="row justify-content-center">
      <div class="col-lg-8 col-md-10">
        <div class="card p-4">
          <h2 class="text-center">{{ treatment?.name }}</h2>

          <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input
              id="fullName"
              v-model="fullName"
              type="text"
              class="form-control"
              placeholder="Rakoto Jean Marc"
            />
          </div>

          <button class="btn btn-primary mt-3" @click="submitForm">
            Submit
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.logo-img {
  max-height: 120px;
  object-fit: contain;
}

.card {
  border-radius: 10px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
}

h2 {
  font-weight: bold;
  margin-top: 0;
}
</style>
