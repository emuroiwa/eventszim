<template>

    <div>
        
        <div class="nav-link font-weight-bold" href="#" v-if="this.cartPage=='header'">
            <div class="float-right gm58-hack">
                <router-link to="/cart">
                    <i class="fas fa-shopping-cart d-inline fas-header"></i> <span class="badge badge-danger">{{itemsInCart}}</span>
                </router-link>
            </div>
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

                    <button type="button" class="btn btn-danger  btn-block" data-dismiss="modal">Continue Shopping</button>
                    
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
            cancelOrder(eventType){
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
                                        status: 3,
                                        event_type: eventType
                                    }).then(()=>{
                                        this.getCartItems();
                                        Fire.$emit('user',this.user);
                                        Fire.$emit('checkAvaliablity');
                                 
                                        swal.fire({
                                            title: "Canceled!",
                                            text: "Your order has been Canceled!",
                                            icon: 'success',
                                            type: "success",
                                            confirmButtonText: "OK"
                                        }).then(okay => {
                                            if(okay){
                                                this.$router.push({ name: 'home' })
                                            }
                                        });

                                    }).catch(()=> {
                                        swal.fire("Failed!", "There was something wrong. "+error, "warning");
                            });
                         }
                    })
            },
           getCartItems(){
               if(this.getCookie('gm58baba')){
                    axios.get("api/cartItems/"+ this.getCookie('gm58baba')).then(({ data }) => {
                        this.itemsInCart = data;
                    }).catch((error)=>{
                        swal.fire("Failed!", "There was something wrong in getCartItems "+ error, "warning");
                    })
               }
           },

       },
       created(){

            Fire.$on('checkAvaliablity',() =>{
                this.getCartItems();
            });
            
            Fire.$on('indexLoaded',() => {
                this.getCartItems();
            });
           
            Fire.$on('cancelOrder',(eventType) => {
                this.cancelOrder(eventType);
            });
       }
    }
</script>
<style scoped>
.gm58-hack{
    width: 100px;
    text-align: center;

}
.navbar-light .navbar-nav .nav-link{
    color: cornflowerblue
}
.fas-header{
    font-size: x-large;
}
</style>

