<script>
import { useRoute } from "vue-router";
import apiService from "@/services/apiService";

export default {
  data() {
    return {
      treatments: [],
    };
  },

  created() {
    this.fetchTreatments();
  },

  methods: {
    fetchTreatments() {
      const lang = navigator.language;
      const route = useRoute();
      const categoryId = route.params.category_id;
      apiService
        .get(`treatments?lang=${lang}&category_id=${categoryId}`)
        .then((data) => {
          this.treatments = data;
        })
        .catch((error) => {
          console.error("Error fetching treatments:", error);
        });
    },

    chooseTreatment(treatment) {
      this.$router.push({
        name: "treatment-selection",
        params: { treatment_id: treatment.treatment_id },
      });
    },
  },
};
</script>

<template>
  <div class="container my-5">
    <!-- Logo -->
    <div class="row mb-5">
      <div class="col text-center">
        <img src="/images/mtomady.jpg" alt="Logo" class="img-fluid logo-img" />
      </div>
    </div>

    <!-- treatments Grid -->
    <div class="row justify-content-center">
      <div
        class="col-lg-4 col-md-6 mb-4"
        v-for="(treatment, index) in treatments"
        :key="index"
      >
        <div class="card treatment-card h-100">
          <!-- Image -->
          <img
            src="/images/category.png"
            class="card-img-top"
            alt="Treatment image"
          />

          <!-- Card Body -->
          <div class="card-body d-flex flex-column">
            <button
              class="choose-btn btn btn-primary mt-auto"
              @click="chooseTreatment(treatment)"
            >
              <h4 class="treatment-title">{{ treatment.name }}</h4>
            </button>
          </div>
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

.treatment-card {
  border: none;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.treatment-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.card-img-top {
  height: 200px;
  object-fit: contain;
  padding: 10px;
  background-color: #fff;
}

.treatment-title {
  font-weight: bold;
  color: #fff;
  margin: 0;
}

.choose-btn {
  border-radius: 30px;
  font-weight: bold;
  display: flex;
  align-items: center;
  justify-content: center;
}

.choose-btn i {
  margin-right: 8px;
}
</style>
