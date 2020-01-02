<template>
    <div>

        <loading :active.sync="isLoading" 
            :can-cancel="false" 
            :loader="'spinner'"
            :is-full-page="fullPage"
            :color="'#3490DC'"
            :height="150"
            :width="150" class="text-center"></loading>
        <div class="card card-body border-danger table-responsive  align-items-center" v-if="!orders.length" >
            <img  :src="'/img/paymentlogo/emptycart.png'" class="empty-cart" >
        </div>
        <div class="card card-body border-info table-responsive" v-if="orders.length">
    
            <table class="table table-hover table-responsive">
                <thead>
                    <tr>
                        <th style="width:40%">Description</th>
                        <th style="width:5%">Quantity</th>
                        <th style="width:26%">Local Price</th>
                        <th style="width:26%">USD</th>
                        <th style="width:3%"></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="order in orders" :key="order.id">
                        <td style="width:40%">{{order.event_name}}
                            <p v-if="order.venue && order.town" class="font-weight-bold">Venue {{order.venue}} {{order.town}}</p></td>
                        <td style="width:5%">{{order.quantity}} </td>
                        <td style="width:26%">  
                            <span class="badge badge-info">ZWL</span> {{order.price_zwl * order.quantity | formatNumber}}
                        </td>
                        <td style="width:26%">
                           <span class="badge badge-success">USD</span> {{order.price_usd * order.quantity | formatNumber}}
                            </td>
                        <td style="width:3%"><a href="#"  class="btn btn-danger" @click="deleteTicket(order.id)"><i class="fas fa-trash-alt"></i></a></td>
                    </tr>
                    
                </tbody>
                    <tr>
                        <th style="width:20%">Total</th>
                        <th style="width:5%">{{totalTickets}}</th>
                        <th style="width:35%"><span class="badge badge-info">ZWL</span>{{totalZWL | formatNumber }}</th>
                        <th style="width:35%" colspan="2"><span class="badge badge-success">USD</span> {{totalUSD | formatNumber }}</th>

                    </tr>
            </table>
        </div>
        <div class="card card-body  border-success mt-1" v-if="orders.length">
            <h4>Select Payment Method</h4>
            <div class="row">
                
                <div class="col-md-4">
                    <a href="#" @click="selectPayment('ecocash',$event)">
                        <div class="card card-body  border-danger grow">
                            <div class="overlay"></div>
                            <img  :src="'/img/paymentlogo/ecocash.png'" >
                        </div>
                    </a>
                </div>
                
                <div class="col-md-4">
                     <a href="#" @click="selectPayment('paypal',$event)">
                        <div class="card card-body  border-primary grow">
                            <div class="overlay"></div>
                            <img  :src="'/img/paymentlogo/paypal.png'" >
                        </div>
                     </a>
                </div>
                <div class="col-md-4">
                    <a href="#" @click="selectPayment('paynow',$event)">
                        <div class="card card-body  border-warning grow">
                            <div class="overlay"></div>
                            <img  :src="'/img/paymentlogo/zimswitch.jpg'" >
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="card card-body border-info mt-1" id="customer" v-if="paymentMethod">
            <h5> Complete the payment details below to secure your tickets.</h5>
            <form @submit.prevent="submitPayment()">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="fullname">Full Name</label>
                            <input v-model="form.fullname" type="text" name="fullname" placeholder="Full Name" class="form-control" :class="{ 'is-invalid': form.errors.has('fullname') }">
                            <has-error :form="form" field="fullname"></has-error>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="contact">Contact Number</label>
                            <input v-model="form.contact" type="number" name="contact" placeholder="Contact" class="form-control" :class="{ 'is-invalid': form.errors.has('contact') }">
                            <has-error :form="form" field="contact"></has-error>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email_ticket">Email To Send Tickets To</label>
                            <input v-model="form.email_ticket" type="email" name="email_ticket" placeholder="Tickets Email" class="form-control" :class="{ 'is-invalid': form.errors.has('email_ticket') }">
                            <has-error :form="form" field="email_ticket"></has-error>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="confirm_email">Confirm Email</label>
                            <input v-model="form.confirm_email" type="email" name="confirm_email" placeholder="Confirm Email" class="form-control" :class="{ 'is-invalid': form.errors.has('confirm_email') }">
                            <has-error :form="form" field="confirm_email"></has-error>
                        </div>
                    </div>
                        
                </div>

            <!-- Modal footer -->
                <div class="form-group">
                    
                    <button  type="submit" class="btn btn-info" ><i class="fas fa-shopping-cart"></i> Check Out</button>
                    <a href="#" class="text-danger" data-dismiss="modal">Cancel</a>
                    
                </div>
            </form>
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
                form: new Form({
                    user_id:'',
                    order_id:'',
                    fullname:'',
                    contact:'',
                    email:'',
                    payment_type:'',
                    }),
            }
        },
        computed:{
            totalZWL: function(){
                return this.orders.reduce(function(total, item){
                return total + item.price_zwl; 
                },0);
            },
            totalUSD: function(){
                return this.orders.reduce(function(total, item){
                return total + item.price_usd; 
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
                console.log('ssss')
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
            submitPayment(){
                this.isLoading = true;
                    this.form.user_id = this.checkCookie();
                    
                    this.form.post('api/customers')
                    .then(()=>{
                        
                    })
                    .catch((error)=>{
                        console.log(error)
                        
                    })

                    //paynow endpoint
                    this.form.post('api/paynow')
                    .then((response)=>{
                        console.log(response) 
                        window.location = response
                    })
                    .catch((error)=>{
                        console.log(error)
                        
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
                    $('card').removeClass('gm58-active')
                    $(e.currentTarget).addClass('gm58-active')
                }
                if(payment=='paynow'){
                    axios.get("api/paynow").then(({ data }) => {
                        console.log(data)
                    }).catch((error)=>{
                    // console.log(rror.response)
                    swal.fire("Failed!", "There was something wrong in getOrders "+ error, "warning");
                    })
                }
                this.paymentMethod=payment
                
            },
            
            getOrders(){
                var user = this.checkCookie();
               // Fire.$emit('user',user);
                  axios.get("api/orders/"+ user).then(({ data }) => {
                        this.orders = data;
                    }).catch((error)=>{
                    // console.log(rror.response)
                    swal.fire("Failed!", "There was something wrong in getOrders "+ error, "warning");
                    })
            },
            
        },
        created(){
             Fire.$on('user',(user) =>{
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
}
a:hover{
     color: #000 !important;
     text-decoration: none !important;
}
a{
     color: #000 !important;
     text-decoration: none !important;
}
.gm58-active{
        -webkit-transform: scale(1.10);
        -ms-transform: scale(1.10);
        transform: scale(1.10);
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
