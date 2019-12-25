/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i)
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default))

import moment from 'moment';
import { Form, HasError, AlertError } from 'vform';
import Gate from "./Gate";
import swal from 'sweetalert2'

import slider from './components/home/slider';
import search from './components/home/search';
import catergories from './components/home/catergories';
import VueRouter from 'vue-router'

Vue.use(VueRouter)
Vue.prototype.$gate = new Gate(window.user);
window.swal = swal;


let routes = [
    { path: '/', component: require('./components/home/indexComponent.vue').default },
    { path: '/home', component: require('./components/home/indexComponent.vue').default },
    { path: '/test', component: require('./components/ExampleComponent.vue').default }
    ]; 

const router = new VueRouter({
    mode: 'history',
    routes // short for `routes: routes`
  })
const toast = swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000
});

window.toast = toast;
window.Form = Form;

Vue.component('slider', slider)
Vue.component('search', search)
Vue.component('catergories', catergories)
Vue.component('not-found',require('./components/NotFound.vue'));
Vue.component('example-component', require('./components/ExampleComponent.vue'));

const app = new Vue({
    el: '#app',
    router
});

