import { createRouter, createWebHistory } from 'vue-router';
import CategorySelection from '@/views/CategorySelection.vue';
import TreatmentSelection from '@/views/TreatmentSelection.vue';
import SelectedTreatment from '../views/SelectedTreatment.vue';

const routes = [
  { path: '/', name: 'category', component: CategorySelection },
  { path: '/treatment/:category_id', name: 'treatment', component: TreatmentSelection },
  { path: '/treatment-selection/:treatment_id', name: 'treatment-selection', component: SelectedTreatment },
];

const router = createRouter({
  history: createWebHistory('/client'),
  routes,
});

export default router;
