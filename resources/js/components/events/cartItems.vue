<template>

    <div class="float-right gm58-hack">
        
        <div class="nav-link font-weight-bold" href="#" v-if="this.cartPage=='header'">
            <router-link to="/cart">
                <i class="fas fa-shopping-cart d-inline fas-header"></i> <span class="badge badge-danger d-inline">{{itemsInCart}}</span>
            </router-link>
        </div>
        <div v-else-if="this.cartPage=='priceCategory'">
            <router-link to="/cart"> 
                <button type="button" class="btn btn-primary" >
                {{itemsInCart}} <i class="fas fa-shopping-cart d-inline "></i> Checkout 
                </button>
            </router-link>
            <a class="nav-link font-weight-bold" href="#"  @click="cancelOrder()"> 
                Cancel order
            </a>
        </div>
               <!-- The Modal -->
        <div class="modal" id="shoppingCartModal" data-backdrop="static" data-keyboard="false">
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
               itemsInCart:'0'
           }
       },
       methods: {
            getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                //sconsole.log(decodedCookie)
                var ca = decodedCookie.split(';');
                for(var i = 0; i <ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                    }
                }
                return "";
            },
            cancelOrder(){
                swal.fire({
                    icon: 'info',
                    title: 'Are you sure?',
                    text: 'You want to cancel order',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, cancel it!'
                    }).then((result) => {
                          // Send request to the server
                         if (result.value) {
                             axios.put('api/orders/'+ this.getCookie('gm58baba'), {
                                        status: 3
                                    }).then(()=>{
                                        this.getCartItems();
                                        
                                        Fire.$emit('user',this.user);
                                        Fire.$emit('checkAvaliablity');
                                        swal.fire(
                                            'Canceled!',
                                            'Your file has been Canceled.',
                                            'success'
                                            )
                                        }).catch(()=> {
                                                swal.fire("Failed!", "There was something wrong. "+error, "warning");
                                        });
                         }
                    })
            },
           getCartItems(){
                axios.get("api/cartItems/"+ this.getCookie('gm58baba')).then(({ data }) => {
                    this.itemsInCart = data;
                }).catch((error)=>{
                    // console.log(rror.response)
                swal.fire("Failed!", "There was something wrong in getCartItems "+ error, "warning");
                })
           },

       },
       created(){

            Fire.$on('checkAvaliablity',() =>{
                this.getCartItems();
            });
            
            Fire.$on('indexLoaded',() => {
                this.getCartItems();
            });
            Fire.$on('orderCreated',() => {
                this.getCartItems();
            });
            Fire.$on('cancelOrder',() => {
                this.cancelOrder();
            });
       }
    }
</script>
<style scoped>
.gm58-hack{
    width: 100px;
}
.navbar-light .navbar-nav .nav-link{
    color: cornflowerblue
}
.fas-header{
    font-size: x-large;
}
</style>

