<template>
  <div class="Typeahead search-element">
    <i class="fa fa-spinner fa-spin" v-if="loading"></i>
    <template v-else>
      <i class="fa fa-search" v-show="isEmpty"></i>
      <i class="fa fa-times" v-show="isDirty" @click="reset"></i>
    </template>

    <input type="text"
           class="Typeahead__input"
           placeholder="Search Events, Team, Artist, City..."
           autocomplete="off"
           v-model="query"
           @keydown.down="down"
           @keydown.up="up"
           @keydown.enter="hit"
           @keydown.esc="reset"
           @blur="reset"
           @input="update"/>

    <ul v-show="hasItems">
      <li v-for="(item, $item) in items" :class="activeClass($item)" @mousedown="hit" @mousemove="setActive($item)">
        <span class="name" v-text="item.event_name">1</span>
        <span class="screen-name" v-text="item.start_date"></span>
        <span class="venue" v-text="item.venue"></span>
      </li>
    </ul>
  </div>
</template>

<script>
import VueTypeahead from 'vue-typeahead'

export default {
  extends: VueTypeahead, // vue@1.0.22+
  // mixins: [VueTypeahead], // vue@1.0.21-

  data () {
    return {
      // // The source url
      // // (required)
      // src: 'https://typeahead-js-twitter-api-proxy.herokuapp.com/demo/search',
      // // The data that would be sent by request
      // // (optional)
      // data: {},

      // // Limit the number of items which is shown at the list
      // // (optional)
      // limit: 5,

      // // The minimum character length needed before triggering
      // // (optional)
      // minChars: 3,

      // // Highlight the first item in the list
      // // (optional)
      // selectFirst: false,

      // // Override the default value (`q`) of query parameter name
      // // Use a falsy value for RESTful query
      // // (optional)
      // queryParamName: 'search'
      src: 'api/findEvents',
      limit: 5,
      minChars: 1
    }
  },

  methods: {
    onHit (item) {
      this.$router.push({ path: 'indexEvent', query: { event: item.id } })
      Fire.$emit('user','');
    },
  
    prepareResponseData (data) {
      return data
    }
  }
}
</script>
<style scoped>
.Typeahead {
  position: relative;
}
.Typeahead__input {
  width: 100%;
  font-size: 14px;
  color: #2c3e50;
  line-height: 1.42857143;
  box-shadow: inset 0 1px 4px #3490dc;
  -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
  transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
  font-weight: 300;
  padding: 12px 26px;
  border: none;
  border-radius: 22px;
  letter-spacing: 1px;
  box-sizing: border-box;
}
.Typeahead__input:focus {
  border-color: #3490dc;
  outline: 0;
  box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px #3490dc;
  width: 100% !important;
}
.fa-times {
  cursor: pointer;
}
i {
  float: right;
  position: relative;
  top: 30px;
  right: 29px;
  opacity: 0.4;
}
ul {
  position: absolute;
  padding: 0;
  margin-top: 8px;
  min-width: 100%;
  background-color: #fff;
  list-style: none;
  border-radius: 4px;
  box-shadow: 0 0 10px rgba(0,0,0, 0.25);
  z-index: 1000;
}
li {
  padding: 10px 16px;
  border-bottom: 1px solid #ccc;
  cursor: pointer;
}
li:first-child {
  border-top-left-radius: 4px;
  border-top-right-radius: 4px;
}
li:last-child {
  border-bottom-left-radius: 4px;
  border-bottom-right-radius: 4px;
  border-bottom: 0;
}
span {
  display: block;
  color: #2c3e50;
}
.active {
  background-color: #3490dc;
}
.active span {
  color: white;
}
.name {
  font-weight: 700;
  font-size: 18px;
}
.screen-name {
  font-style: italic;
}
.screen-name {
  font-weight: 700;
  font-style: italic;
}
</style>