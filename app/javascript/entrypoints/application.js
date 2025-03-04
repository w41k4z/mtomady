import { createApp } from 'vue';
import ClientComponent from '@/components/ClientComponent.vue';
import router from '@/router/index.js'

import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';

document.addEventListener('DOMContentLoaded', () => {
    const app = createApp(ClientComponent);
    app.use(router)
    app.mount('#vue-client-app');
});