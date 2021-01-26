import Vue from 'vue';
import App from './App';
import 'babel-polyfill';

// router ==========================================
import VueRouter from 'vue-router'
Vue.use(VueRouter)
import router from './router/index';

// store ==========================================
import Vuex from 'vuex'
Vue.use(Vuex)
import store from './store'

const app = new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
