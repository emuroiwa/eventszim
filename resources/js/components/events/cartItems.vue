<template>

    <div class="float-right">
        
        <a class="nav-link font-weight-bold" href="#"  data-toggle="modal" data-target="#shoppingCartModal" v-if="this.cartPage=='header'">
            <i class="fas fa-shopping-cart d-inline "></i> Cart<span class="badge badge-danger d-inline">{{itemsInCart}}</span>
        </a>
        <div v-else-if="this.cartPage=='priceCategory'">
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#shoppingCartModal">
            {{itemsInCart}} <i class="fas fa-shopping-cart d-inline "></i> Checkout 
            </button>
            <a class="nav-link font-weight-bold" href="#"  data-toggle="modal" data-target="#shoppingCartModal"> 
                Cancel order
            </a>
        </div>
               <!-- The Modal -->
        <div class="modal" id="shoppingCartModal">
            <div class="modal-dialog  modal-lg">
                <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header event-card-header">
                    <h4 class="modal-title">Shopping Cart</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <shoppingCart></shoppingCart>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">

                    <button type="button" class="btn btn-danger" data-dismiss="modal">Continue Shopping</button>
                    
                </div>

                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            cartPage: String
        },
       data(){
           return{
               itemsInCart:{}
           }
       },
       methods: {
           getCartItems(){
                axios.get("api/cartItems").then(({ data }) => {
                    this.itemsInCart = data;
                }).catch((error)=>{
                    // console.log(rror.response)
                swal("Failed!", "There was something wrong in getEvents "+ error, "warning");
                })
           },

       },
       created(){
            Fire.$on('DeletedItem',() =>{
                this.getCartItems()
            });
           this.getCartItems();
       }
    }
</script>

