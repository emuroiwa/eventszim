<template>
    <div class="container">
        <loading :active.sync="isLoading" 
        :can-cancel="false" 
        :loader="'spinner'"
        :is-full-page="fullPage"
        :color="'#3490DC'"
        :height="150"
        :width="150" class="text-center"></loading>
        <div class="card border-primary mb-4 mt-3">
            <div class="card-header event-card-header mb-1">
                <h4 class="card-title">Shopping Cart</h4>
                                <!-- <h5>Choose Venue & Date/Time</h5> -->
            </div>
            <div class="card-body">
                <div class="card card-body border-danger align-items-center" v-if="!orders.length" >
                    <img  :src="'/img/paymentlogo/emptycart.png'" class="empty-cart" >
                    <router-link to="/home"> 
                        <button type="button" class="btn btn-primary" >
                            <i class="fas fa-shopping-cart d-inline "></i> Add Tickets 
                        </button>
                    </router-link>
                </div>
                <div class="card card-body border-info" v-if="orders.length">
            
                    <table class="table table-hover table-responsive">
                        <thead>
                            <tr>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Local Price</th>
                                <th>USD</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="order in orders" :key="order.id">
                                <td>{{order.event_name}} <small>{{order.description}}</small>
                                    <p v-if="order.venue && order.town" class="font-weight-bold">Venue {{order.venue}} {{order.town}}</p></td>
                                <td>{{order.quantity}} </td>
                                <td>  
                                    <p><small>{{order.price_zwl | formatNumber}} each </small></p>
                                    <span class="badge badge-info">ZWL</span> {{order.price_zwl * order.quantity | formatNumber}}
                                </td>
                                <td>
                                <p><small>{{order.price_usd | formatNumber}} each </small></p>
                                <span class="badge badge-success">USD</span> {{order.price_usd * order.quantity | formatNumber}}
                                    </td>
                                <td><a href="#"  class="btn btn-danger" @click="deleteTicket(order.id)"><i class="fas fa-trash-alt"></i></a></td>
                            </tr>
                            
                        </tbody>
                            <tr>
                                <th>Total</th>
                                <th>{{totalTickets}}</th>
                                <th><span class="badge badge-info">ZWL</span>{{totalZWL | formatNumber }}</th>
                                <th colspan="2"><span class="badge badge-success">USD</span> {{totalUSD | formatNumber }}</th>

                            </tr>
                    </table>
                </div>
                <div class="card card-body  border-success mt-1" v-if="orders.length">
                    <h4>Select Payment Method</h4>
                    <div class="row">
                        
                        <div class="col-md-4">
                            <div class="card card-body  border-danger grow"  @click="selectPayment('ecocash',$event)">
                                <img  :src="'/img/paymentlogo/ecocash.png'" >
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="card card-body  border-primary grow"  @click="selectPayment('paypal',$event)">
                                <img  :src="'/img/paymentlogo/paypal.png'" >
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-body  border-warning grow"  @click="selectPayment('paynow',$event)">
                                <img  :src="'/img/paymentlogo/zimswitch.jpg'" >
                            </div>
                        </div>
                    </div>
                </div>
                <div id="customer"> 
                    <!-- modal for mobile -->
                    <div class="modal" id="customerDetails" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog  modal-lg">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header event-card-header">
                                    <h4 class="modal-title">Shopping Cart</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <addCustomer :paymentType="this.paymentMethod" :total_USD="totalUSD" :total_ZWL="totalZWL"></addCustomer>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card card-body border-info mt-1" v-if="isNotMobile">
                        <addCustomer :paymentType="this.paymentMethod" :total_USD="totalUSD" :total_ZWL="totalZWL"></addCustomer>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                orders:{},
                paymentMethod:'',
                isLoading: false,
                fullPage: true,
                isNotMobile:false

            }
        },
        computed:{
            totalZWL: function(){
                return this.orders.reduce(function(total, item){
                return total + item.total_zwl; 
                },0);
            },
            totalUSD: function(){
                return this.orders.reduce(function(total, item){
                return total + item.total_usd; 
                },0);
            },
            totalTickets: function(){
                return this.orders.reduce(function(total, item){
                return total + item.quantity; 
                },0);
            },

        },
        methods: {
             deleteTicket(id){
                var user =this.checkCookie();
                // swal.fire("Failed!", "There was something wrong in getOrders ", "warning");
                
                swal.fire({
                    icon: 'info',
                    title: 'Are you sure?',
                    text: 'You want to delete this item',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {

                        // Send request to the server
                         if (result.value) {
                             axios.delete('api/orders/'+id).then(()=>{
                                        this.getOrders();
                                        Fire.$emit('user',this.user);
                                        Fire.$emit('checkAvaliablity');
                                        swal.fire(
                                            'Deleted!',
                                            'Your file has been deleted.',
                                            'success'
                                            )
                                        }).catch(()=> {
                                                swal.fire("Failed!", "There was something wrong. "+error, "warning");
                                        });
                         }
                    })
            
             },
            
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
            setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires="+d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            },
            checkCookie() {
                var user = this.getCookie("gm58baba");
                if(user != ""){
                    // console.log(user)
                    return user
                } 
                else {
                    user = new Date().valueOf();
                    if (user != "" && user != null) {
                        this.setCookie("gm58baba", user, 365);
                        return user

                    }
                }
            },
            selectPayment(payment,e){
                if(e!=""){
                    $('.card').removeClass('gm58-active')
                    $(e.currentTarget).addClass('gm58-active')
                }
                let isMobile = window.matchMedia("only screen and (max-width: 760px)").matches;
                this.paymentMethod=payment
                if (isMobile) {
                    //open modal
                   // $('#customerDetails').modal('show');
                    this.isNotMobile= true;
                }else{
                    
                    this.isNotMobile= true;

                }
                
            },
            
            getOrders(){
                this.isLoading = true;
                var user = this.checkCookie();
                axios.get("api/orders/"+ user).then(({ data }) => {
                        this.orders = data;
                        this.isLoading = false;
                    }).catch((error)=>{
                    swal.fire("Failed!", "There was something wrong in getOrders "+ error, "warning");
                })
            },
           
        },
        created(){

            Fire.$on('user',(user) =>{
                this.getOrders()
            });
            Fire.$emit('indexLoaded') 

            Fire.$on('checkAvaliablity',() =>{
            this.getOrders()
             });
             this.getOrders()

        }
    }
</script>
<style scoped>
    .grow:hover
    {
        -webkit-transform: scale(1.05);
        -ms-transform: scale(1.05);
        transform: scale(1.05);
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.2);
    }
    a:hover{
        color: #000 !important;
        text-decoration: none !important;
    }
    a{
        /* color: #000 !important; */
        text-decoration: none !important;
        
    }
    .gm58-active{
            -webkit-transform: scale(1.10);
            -ms-transform: scale(1.10);
            transform: scale(1.10);

            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 #1fc8db;
    }
    .overlay {
        /* position: absolute; */
        width: 100%;
        height: 100%;
        z-index: 2;
        background-image: linear-gradient(141deg,#db109e 0%, #1fc8db 51%, #2cb5e8 75%);
        opacity: .1;
    }
    .empty-cart {
        align-items: center;
        max-width: 60%;
    }
</style>
<style lang="scss" scoped>
@media 
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr { 
		display: block; 
	}
	
	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr { 
		position: absolute;
		top: -9999px;
		left: -9999px;
	}
	
	tr { border: 1px solid #ccc; }
	
	td { 
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee; 
		position: relative;
		padding-left: 50%; 
	}
	
	td:before { 
		/* Now like a table header */
		display: block;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%; 
		padding-right: 10px; 
		white-space: nowrap;
	}
	
	/*
	Label the data
	*/
	td:nth-of-type(1):before { content: "Description"; }
	td:nth-of-type(2):before { content: "Quantity"; }
	td:nth-of-type(3):before { content: "Local Price"; }
	td:nth-of-type(4):before { content: "USD"; }
	td:nth-of-type(5):before { content: ""; }

}
</style>