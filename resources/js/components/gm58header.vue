<template>

    <div>
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <router-link to="/home"> 
                    <img class="navbar-brand" :src="'img/logo.png'" :alt="'Ticketbook Logo'">
                </router-link>

                <div class="navbar-toggler" aria-controls="navbarSupportedContent" aria-expanded="false" >
                    
                    <cartItems :cartPage="this.cartPage"></cartItems>
                </div>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <div class="navbar-collapse collapse" id="navbar6">
                        <div class="mx-2 my-auto d-inline w-100">
                            <search></search>
                        </div>
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <cartItems :cartPage="this.cartPage"></cartItems>
                            </li>
                        </ul>
                    </div>
                
                    
                </div>
            </div>
            <div class="row w-100 mobile-header" >
                <div class="col-md-12">
                    <!-- <li class="nav-item search-nav-element"> -->
                        <search></search>
                    <!-- </li> -->
                </div>
            </div>
        </nav>



        
            
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
.haya{
    top: 10 
}
.vertical-center {
  margin: 0;
  position: absolute;
  top: 50%;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
}
</style>