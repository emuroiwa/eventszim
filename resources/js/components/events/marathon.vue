<template>
    <div class="container">
        <loading :active.sync="isLoading" 
        :can-cancel="false" 
        :loader="'spinner'"
        :is-full-page="fullPage"
        :color="'#3490DC'"
        :height="150"
        :width="150" class="text-center"></loading>
        <h5>Marathon Categories</h5>
        <!-- <div class="card card-body border-primary" data-toggle="collapse" href="#priceCategory" role="button" aria-expanded="false" aria-controls="priceCategory">
                 <div class="row">
                    <div class="col-md-9">
                        Price Category<br>
                        Price
                    </div>
                    <div class="col-md-3">
                        <p>Status</p>
                    </div>
                </div>
        </div> -->
        <div v-if="eventData.events[0].price_categories.length > 0">
            <form @submit.prevent="">
                <!-- <div class="collapse mt-1" id="priceCategory"> -->
                    <!-- {{eventData.events[0].price_categories}} -->
                    <div class="card card-body  border-primary mt-1" v-for="event in eventData.events[0].price_categories" :key="event.id">
                        <div class="row">
                            <div class="col-md-5 font-weight-bold">
                                {{event.description}}
                            </div>
                            <div class="col-md-4">
                                <span class="badge badge-info">ZWL</span> {{event.price_zwl | formatNumber}}<br/>
                                <span class="badge badge-success">USD</span> {{event.price_usd | formatNumber }}<br/>
                            </div>
                            <div class="col-md-3">
                                <select class="form-control"  @change="onChangeTickets($event)">
                                    <option>0</option>
                                    <option v-for="index in event.max_tickets" :key="index" :data-id="event.id">
                                        {{index}}
                                    </option>
                                
                                </select>
                            </div>
                        </div>
                        
                    </div>
                    <div class=" card card-body gm58-card border-primary mt-1">
                        <div class=" card card-body gm58-card border-primary mt-1" v-if="!orders.length">
                            Please enter ticket details for each ticket bought 
                        </div>
                            <marathonDetails ref="marathonDetails"></marathonDetails>
                            <!-- <ul class="timeline">
                                <h3>Tickets Selected</h3>
                                <li v-for="order in orders" :key="order.id" class="font-weight-bold">
                                    
                                    {{order.quantity}} X {{order.description}} <span class="badge badge-info">ZWL</span> {{order.price_zwl | formatNumber}} <span class="badge badge-success">USD</span> {{order.price_usd | formatNumber}} 
                                </li>
                                <li>
                                    <cartItems :cartPage="this.cartPage"></cartItems>
                                </li>
                            </ul> -->
                    </div>
                   
                <!-- </div> -->

            </form>
        </div>
        <div v-else>
            <div class="card card-body  border-danger mt-1">
                <h3>No tickets for this event</h3>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            eventData: Object
        },
        data(){
            return{
                tickets:{},
                orders:{},
                isLoading: false,
                fullPage: true,
                cartPage:'priceCategory',
                 form: new Form({
                    quantity:'',
                    category_id:'',
                    }),
                
            }
        },
        methods: {
            onChangeTickets(e) {
                this.isLoading = true
                var user = this.getCookie('gm58baba');
                if (e.target.options[e.target.options.selectedIndex].value > 0) {
                    this.form.quantity = e.target.options[e.target.options.selectedIndex].value;
                    this.form.category_id = e.target.options[e.target.options.selectedIndex].dataset.id;
                    this.form.user_id = user
                    this.form.event_type = 'marathon'
                    this.form.post('api/orders')
                    .then((data)=>{
                        
                        Fire.$emit('indexLoaded');
                        this.getOrders();

                    })
                }
            },
             getOrders() {
                axios.get("api/orders/"+ this.getCookie('gm58baba')).then(({ data }) => {
                        this.orders = data;
                    }).catch((error)=>{
                        swal.fire("Failed!", "There was something wrong in getOrders "+ error, "warning");
                    })
            },
            selectPayment(payment,e){
                if (e!="") {
                    $('.card').removeClass('gm58-active')
                    $(e.currentTarget).addClass('gm58-active')
                }
                let isMobile = window.matchMedia("only screen and (max-width: 760px)").matches;
                this.paymentMethod=payment
                if (isMobile) {
                    //open modal
                   // $('#customerDetails').modal('show');
                    this.isNotMobile= true;
                } else { 
                    
                    this.isNotMobile= true;

                }
            },
            getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for (var i = 0; i < ca.length; i++) {
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
       },
        created(){
            this.getOrders();
        }
    }
</script>
<style scoped>
    ul.timeline {
        list-style-type: none;
        position: relative;
    }
    .gm58-card { 
        padding: 0.25rem;
    }
    ul.timeline:before {
        content: ' ';
        background: #d4d9df;
        display: inline-block;
        position: absolute;
        left: 29px;
        width: 2px;
        height: 100%;
        z-index: 400;
    }
    ul.timeline > li {
        margin: 20px 0;
        padding-left: 20px;
    }
    ul.timeline > li:before {
        content: ' ';
        background: white;
        display: inline-block;
        position: absolute;
        border-radius: 50%;
        border: 3px solid #22c0e8;
        left: 20px;
        width: 20px;
        height: 20px;
        z-index: 400;
    }

</style>
