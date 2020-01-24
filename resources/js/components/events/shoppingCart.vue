<template>
    <div class="container">
        <loading :active.sync="isLoading" 
        :can-cancel="false" 
        :loader="'spinner'"
        :is-full-page="fullPage"
        :color="'#3490DC'"
        :height="150"
        :width="150" class="text-center"></loading>
        
        <div class="card border-primary mb-4 mt-3" v-if="marathons">
            <div class="card-header event-card-header mb-1">
                <h4 class="card-title">Marathon Details</h4>
                                <!-- <h5>Choose Venue & Date/Time</h5> -->
            </div>
            <div class="card-body">
                 <marathonDetails></marathonDetails>
            </div>
        </div>

        <div class="card border-primary mb-4 mt-3" v-else >
            <div class="card-header event-card-header mb-1">
                <h4 class="card-title">Shopping Cart </h4>
                                <!-- <h5>Choose Venue & Date/Time</h5> -->
            </div>
            <div class="card-body">
                <div class="card card-body border-danger align-items-center" v-if="!orders.length" >
                    <!-- <testdetails></testdetails> -->
                    <img  :src="'/img/paymentlogo/emptycart.png'" class="empty-cart" >
                    <router-link to="/home"> 
                        <button type="button" class="btn btn-primary btn-block" >
                            <i class="fas fa-shopping-cart d-inline "></i> Add Tickets 
                        </button>
                    </router-link>
                </div>
                <div class="card card-body border-info" v-if="orders.length">
            
                    <table>
                        <thead> 
                            <tr>
                                <th scope="col">Description</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Local Price</th>
                                <th scope="col">USD</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="order in orders" :key="order.id">
                                <td data-label="Description">{{order.event_name}} <small>{{order.description}}</small>
                                    <p v-if="order.venue && order.town" class="font-weight-bold">Venue {{order.venue}} {{order.town}}</p></td>
                                <td data-label="Quantity">{{order.quantity}} </td>
                                <td data-label="Local Price">  
                                    <p><small>{{order.price_zwl | formatNumber}} each </small></p>
                                    <span class="badge badge-info">ZWL</span> {{order.price_zwl * order.quantity | formatNumber}}
                                </td>
                                <td data-label="USD">
                                <p><small>{{order.price_usd | formatNumber}} each </small></p>
                                <span class="badge badge-success">USD</span> {{order.price_usd * order.quantity | formatNumber}}
                                    </td>
                                <td data-label=""><a href="#"  class="btn btn-danger btn-block" @click="deleteTicket(order.id)"><i class="fas fa-trash-alt"></i></a></td>
                            </tr>
                            
                        </tbody>
                            <tr>
                                <th data-label="Description">Total</th>
                                <th data-label="Quantity">{{totalTickets}}</th>
                                <th data-label="Local Price"><span class="badge badge-info">ZWL</span>{{totalZWL | formatNumber }}</th>
                                <th data-label="USD" colspan="2"><span class="badge badge-success">USD</span> {{totalUSD | formatNumber }}</th>

                            </tr>
                    </table>
                </div>
                <!-- <div class="card card-body  border-success mt-1" v-if="orders.length">
                    <h4>Select Payment Method </h4>
                    <div class="row">
                        
                        <div class="col-md-4">
                            <div class="card card-body  border-danger grow"  @click="selectPayment('ecocash',$event)">
                                <img  :src="'/img/paymentlogo/ecocash.png'" >
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="card card-body  border-secondary notworking">
                                
                                <img  :src="'/img/paymentlogo/paypal.png'" >
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card card-body  border-warning grow"  @click="selectPayment('paynow',$event)">
                                <img  :src="'/img/paymentlogo/zimswitch.jpg'" >
                            </div>
                        </div>
                    </div>
                </div> -->
                <div id="customer" v-if="orders.length"> 
                    <!-- modal for mobile -->
                    <!-- <div class="modal" id="customerDetails" data-backdrop="static" data-keyboard="false">
                        <div class="modal-dialog  modal-lg">
                            <div class="modal-content">

                                
                                <div class="modal-header event-card-header">
                                    <h4 class="modal-title">Shopping Cart</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                              
                                <div class="modal-body">
                                    <addCustomer :paymentType="this.paymentMethod" :total_USD="totalUSD" :total_ZWL="totalZWL" :orders="this.orders"></addCustomer>
                                </div>
                            </div>
                        </div>
                    </div> -->

                    <addCustomer :paymentType="this.paymentMethod" :total_USD="totalUSD" :total_ZWL="totalZWL" :orders="orders"  ref="addCustomer"></addCustomer>
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
                paymentMethod:'paynow',
                isLoading: false,
                fullPage: true,
                isNotMobile:false,
                EventType:'',
                marathons:''

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
                            this.paymentMethod="paynow"

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
                    this.isNotMobile = true;
                }else{
                    
                    this.isNotMobile = true;

                }
            },
            
            getOrders(){
                this.isLoading = true;
                var user = this.checkCookie();
                axios.get("api/orders/"+ user).then(({ data }) => {
                        this.orders = data;
                        this.isLoading = false;
                        // this.$refs.marathonDetails.setTickets(data);
                    }).catch((error)=>{
                        console.log(error)
                    // swal.fire("Failed!", "There was something wrong in getOrders "+ error, "warning");
                })
            },

            checkMarathons(){
                var user = this.checkCookie();
                axios.get("api/checkMarathon/"+ user).then(({ data }) => {
                        this.marathons = data;
                    }).catch((error)=>{
                        console.log(error)
                })
            },
           
        },
        created(){
            this.paymentMethod='paynow'
            
            Fire.$on('user',(user) =>{
                this.getOrders()
            });
            Fire.$on('checkAvaliablity',() =>{
            this.getOrders()
            });
            Fire.$on('marathonSaved',() =>{
                this.checkMarathons()
            });

            Fire.$emit('indexLoaded') 
            this.checkMarathons()
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
    .notworking:hover
    {
       
        /* box-shadow: 0 4px 8px 0 grey, 0 6px 20px 0 grey; */
    }
    .overlay {
        position: absolute;
        width: 100%;
        height: 100%;
        z-index: 2;
        background-image: linear-gradient(141deg,#db109e 45%, #fff 0%, #fff 75%);
        opacity: .1;
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
   
    table {
    border: 1px solid #ccc;
    border-collapse: collapse;
    margin: 0;
    padding: 0;
    width: 100%;
    table-layout: fixed;
    }

    table caption {
    font-size: 1.5em;
    margin: .5em 0 .75em;
    }

    table tr {
    background-color: #f8f8f8;
    border: 1px solid #ddd;
    padding: .35em;
    }

    table th,
    table td {
    padding: .625em;
    }

    table th {
    font-size: .85em;
    letter-spacing: .1em;
    text-transform: uppercase;
    }

    @media screen and (max-width: 600px) {
    table {
        border: 0;
    }

    table caption {
        font-size: 1.3em;
    }
    
    table thead {
        border: none;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
    }
    
    table tr {
        border-bottom: 3px solid #ddd;
        display: block;
        margin-bottom: .625em;
    }
    
    table td {
        border-bottom: 1px solid #ddd;
        display: block;
        font-size: .8em;
        text-align: right;
    }
    
    table td::before {
        /*
        * aria-label has no advantage, it won't be read inside a table
        content: attr(aria-label);
        */
        content: attr(data-label);
        float: left;
        font-weight: bold;
        text-transform: uppercase;
    }
    
    table td:last-child {
        border-bottom: 0;
    }
    }
</style>