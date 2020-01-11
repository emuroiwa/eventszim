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
import Loading from 'vue-loading-overlay';
import Axios from 'axios'

import slider from './components/home/slider';
import cartItems from './components/events/cartItems';
import gm58footer from './components/gm58footer';
import gm58header from './components/gm58header';
import shoppingCart from './components/events/shoppingCart';
import search from './components/home/search';
import catergories from './components/home/catergories';
import thisWeek from './components/home/thisWeek';
import eventDetails from './components/events/eventDetails';
import eventAddtional from './components/events/eventAddtional';
import priceCategory from './components/events/priceCategory';
import addCustomer from './components/events/customerDetails';
import VueRouter from 'vue-router'

Vue.use(VueRouter)
Vue.prototype.$gate = new Gate(window.user);
window.swal = swal;


let routes = [
    { path: '/', component: require('./components/home/indexComponent.vue').default },
    { path: '/home', component: require('./components/home/indexComponent.vue').default },
    { path: '/test', component: require('./components/ExampleComponent.vue').default },
    { path: '/indexEvent', component: require('./components/events/indexEvent.vue').default,props: true,name: 'indexEvent' },
    { path: '/cart', component: require('./components/events/shoppingCart.vue').default,props: true,name: 'cart' },
    { path: '/terms', component: require('./components/company/terms.vue').default,props: true,name: 'terms' },
    { path: '/contact', component: require('./components/company/contact.vue').default,props: true,name: 'contact' },
    { path: '/about', component: require('./components/company/about.vue').default,props: true,name: 'about' },
    { path: '/howto', component: require('./components/company/howto.vue').default,props: true,name: 'howto' },
    { path: '/sell', component: require('./components/company/sell.vue').default,props: true,name: 'sell' },
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
window.Fire =  new Vue();

Vue.filter('myDate',function(created){
  return moment(created).format('Do MMMM YYYY');
});
Vue.filter('formatNumber', function(value){
  let val = (value/1).toFixed(2).replace(' ', ',');
  return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
});

Vue.filter('isMobile', function(){
  let isMobile = window.matchMedia("only screen and (max-width: 760px)").matches;
  return isMobile;
});
Vue.component('Loading',Loading)

Vue.component('gm58footer', gm58footer)
Vue.component('addCustomer', addCustomer)
Vue.component('gm58header', gm58header)
Vue.component('slider', slider)
Vue.component('cartItems', cartItems)
Vue.component('shoppingCart', shoppingCart)
Vue.component('search', search)
Vue.component('catergories', catergories)
Vue.component('thisWeek', thisWeek)
Vue.component('eventDetails', eventDetails)
Vue.component('eventAddtional', eventAddtional)
Vue.component('priceCategory', priceCategory)
Vue.component('not-found',require('./components/NotFound.vue'));
Vue.component('example-component', require('./components/ExampleComponent.vue'));

Vue.prototype.$http = Axios

const app = new Vue({
    el: '#app',
    router
});

