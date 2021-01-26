import Vue from 'vue';
import VueRouter from 'vue-router';

import Home from 'pages/Home';
import Sample from 'pages/Sample';

const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/sample', name: 'Sample', component: Sample },
]

const router = new VueRouter({
  base: '/',
  routes,
})

export default router;
