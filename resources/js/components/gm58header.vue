<template>
    <div class="navbar-nav mc-auto search-element">
            <ul class="navbar-nav mc-auto inner-search-element">
                <li class="nav-item search-nav-element">
                    <search></search>
                </li>
            </ul>
            <!-- Right Side Of Navbar -->
            <ul class="navbar-nav ml-auto">
                <!-- Authentication Links -->
                <li class="nav-item">
                    <cartItems :cartPage="this.cartPage"></cartItems>
                </li>
            </ul>
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