import { createRouter, createWebHistory } from 'vue-router';
import CategoryList from '@/components/CategoryList.vue';
import TreatmentList from '@/components/TreatmentList.vue';

const routes = [
  { path: '/', component: CategoryList },
  { path: '/treatment', component: TreatmentList },
];

const router = createRouter({
  history: createWebHistory('/client'),
  routes,
});

export default router;
