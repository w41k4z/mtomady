import { createRouter, createWebHistory } from 'vue-router';
import CategorySelection from '@/views/CategorySelection.vue';
import TreatmentSelection from '@/views/TreatmentSelection.vue';

const routes = [
  { path: '/', name: 'Category', component: CategorySelection },
  { path: '/treatment', name: 'Treatment', component: TreatmentSelection },
];

const router = createRouter({
  history: createWebHistory('/client'),
  routes,
});

export default router;
