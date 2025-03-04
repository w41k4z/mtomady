<script>
import apiService from "@/services/apiService";

export default {
  data() {
    return {
      categories: [],
    };
  },

  created() {
    this.fetchCategories();
  },

  methods: {
    fetchCategories() {
      const lang = navigator.language;

      apiService
        .get(`categories?lang=${lang}`)
        .then((data) => {
          this.categories = data;
        })
        .catch((error) => {
          console.error("Error fetching categories:", error);
        });
    },

    chooseCategory(category) {
      if (category && category.category_id) {
        this.$router.push({
          name: "treatment",
          params: { category_id: category.category_id },
        });
      } else {
        console.error("Invalid category object:", category);
      }
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

    <!-- Categories Grid -->
    <div class="row justify-content-center">
      <div
        class="col-lg-4 col-md-6 mb-4"
        v-for="(category, index) in categories"
        :key="index"
      >
        <div class="card category-card h-100">
          <!-- Image -->
          <img
            src="/images/category.png"
            class="card-img-top"
            alt="Category image"
          />

          <!-- Card Body -->
          <div class="card-body d-flex flex-column">
            <button
              class="choose-btn btn btn-primary mt-auto"
              @click="chooseCategory(category)"
            >
              <h4 class="category-title">{{ category.name }}</h4>
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

.category-card {
  border: none;
  border-radius: 15px;
  overflow: hidden;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.category-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.card-img-top {
  height: 200px;
  object-fit: contain;
  padding: 10px;
  background-color: #fff;
}

.category-title {
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
