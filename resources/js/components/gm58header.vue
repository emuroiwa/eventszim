<template>
    <div class="row w-100">
            <div class="col-md-9 "  align="center" >
                <!-- <li class="nav-item search-nav-element"> -->
                    <search></search>
                <!-- </li> -->
            </div>
            <!-- Right Side Of Navbar -->
            <div class="col-md-3 align-right">
                <cartItems :cartPage="this.cartPage"></cartItems>
            </div>
    </div>
</template>

<script>
    export default {

        data(){
            return{
                tickets:{},
                orders:{},
                cartPage:'header',
                 form: new Form({
                    quantity:'',
                    category_id:'',
                    }),
                
            }
        },
        methods: {

        },
        created(){
            //this.getEvent();
        }
    }
</script>
<style scoped>
.vertical-center {
  margin: 0;
  position: absolute;
  top: 50%;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}
</style>