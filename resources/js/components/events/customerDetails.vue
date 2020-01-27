<template>
    <div>
        <loading :active.sync="isLoading" 
        :can-cancel="false" 
        :loader="'spinner'"
        :is-full-page="fullPage"
        :color="'#3490DC'"
        :height="150"
        :width="150" class="text-center"></loading>
                <form @submit.prevent="submitPayment()" v-if="paymentType">
                    <div class="card card-body border-info mt-1" > 
                        <h5> Complete the payment details below to secure your tickets.</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="fullname">Full Name*</label>
                                        <input v-model="form.fullname" type="text" name="fullname" class="form-control" :class="{ 'is-invalid': form.errors.has('fullname') }" required>
                                        
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="contact" v-if="paymentType=='ecocash'"><b>ECOCASH NUMBER</b></label>
                                        <label for="contact" v-if="paymentType!='ecocash'">Contact Number</label>*
                                        <input v-model="form.contact" type="number"   name="contact" maxlength="10" placeholder="eg 0771111111" class="form-control" :class="{ 'is-invalid': form.errors.has('contact') }" required> 
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email_ticket"><b>Email To Send Tickets To</b>*</label>
                                        <input v-model="form.email_ticket" type="email" name="email_ticket"  class="form-control" :class="{ 'is-invalid': form.errors.has('email_ticket') }" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="confirm_email">Confirm Email*</label>
                                        <input v-model="form.confirm_email" type="email" name="confirm_email"  class="form-control" :class="{ 'is-invalid': form.errors.has('confirm_email') }" required>
                                    </div>
                                </div>
                            </div>
                            

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="checkbox" id="terms" v-model="form.terms"> <a href="#" @click="terms()"> I accept terms and conditions </a>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <button  type="submit" class="btn btn-info is-mobile-btn" ><i class="fas fa-shopping-cart"></i> Check Out</button>
                                <a href="#" class="text-danger"  @click="cancelOrder()">Cancel</a>
                            </div>
                    </div>
                </form>
    </div>
</template>
<script>
    export default {
        props: {
            paymentType: String,
            event_type: String,
            total_USD: Number,
            total_ZWL: Number,
            orders:Array
        },
       
        data() {
            return {
                isLoading: false,
                fullPage: true,
                email:'',
                contact:'',
                ticketDetail: {
                    fullname: '',
                    contact: '',
                    email:'',
                    tshirtsize:'',
                    gender:'',
                    pack:'',
                    category:'',
                    event:'',
                    }, 
                ticketDetails:[],
                form: new Form({
                    user_id:'',
                    order_id:'',
                    fullname:'',
                    contact:'',
                    email:'',
                    payment_type:'',
                    payment_ref:'',
                    total_ZWL:'',
                    total_USD:'',
                    terms:false,
                    gender:'',
                    }),
            }
        },
        
        methods: {
            terms() {
                let routeData = this.$router.resolve({name: 'terms'});
                window.open(routeData.href, '_blank');
            },
            submitPayment() {
                //refactor here for v2
                if (this.form.email_ticket != this.form.confirm_email) {
                    swal.fire("Failed!", "Make sure emails match ", "warning");
                    return;
                }
                if (!this.form.terms) {
                    swal.fire("Failed!", "Please accept terms and condtions to proceed with transactions ", "warning");
                    return;
                }
                    this.form.user_id = this.checkCookie();
                    this.form.payment_type = this.paymentType;
                    this.form.total_USD = this.total_USD;
                    this.form.total_ZWL = this.total_ZWL;

                    this.isLoading = true;

                    if (this.paymentType != 'paypal') {
                            //paynow endpoint
                        this.form.post('api/paynow')
                            .then((response)=>{
                                console.log(response.data)
                            window.location.href = response.data
                        })
                        .catch((error)=>{
                            console.log(error)
                            swal.fire("Failed!", "There was something wrong paynow. "+error, "warning");
                                
                            })
                    }  
            },
            
            getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for (var i = 0; i <ca.length; i++) {
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
            cancelOrder() {
                Fire.$emit('cancelOrder','all');
                this.paymentMethod="";
            },

        
        },
        computed: {

        },
        
       

    }
</script>

