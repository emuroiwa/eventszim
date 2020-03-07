<template>
    <div class="container">
        <vue-element-loading :active="isLoading" :is-full-screen="true" :size="'80'" :color="'#FF6700'" :text="'We are now processing your payment.............Check your SPAM folder if email is not in inbox'"/>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Payment processing kindly be patient <p class="text-danger"> Check your SPAM folder if email is not in inbox</p></div>

                    <div class="card-body">
                        <!-- <img src="/img/payment-animation.gif"/> -->
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
                userData:{},
                isLoading: false,
                fullPage: true,
                order_id:''
            }
        },
        methods:{
            verifyPayment(ref){
                this.isLoading = true;
                
                axios.get("api/paymentsdetails/" + ref).then(({ data }) => {
                    this.userData = data;

                        axios.get("api/paynow/"+ ref).then(({ data }) => {
                            this.ticketsEmail(data,ref)
                        }).catch((error)=>{
                            swal.fire("Failed!", "There was something wrong in verifyPayment "+ error, "warning");
                        })

                }).catch((error)=>{
                    swal("Failed!", "There was something wrong in getUserData "+ error, "warning");
                })
            },

            ticketsEmail(response,ref){
                
                var emailType = ""
                var emailHeading = ""
                var paymentResponse = response.message;
                   if(paymentResponse == 'done'){
                       emailType = 'success';
                       emailHeading = 'Ticketbook Confimation of Ticket Purchase'

                   }else{
                       emailType = 'cancel'
                       emailHeading = 'Ticketbook Cancellation of Ticket Purchase'
                   }
                   axios.post('api/sendemail', {
                        email:this.userData[0].email,
                        client_name: this.userData[0].fullname,
                        subject: emailHeading + this.order_id,
                        email_type: emailType,
                        order_id: this.order_id
                    }).then((response) => {
                        this.isLoading = false
                        if(paymentResponse == 'done'){

                            swal.fire({
                                title: "Success!",
                                text: "Thank you for your purchase, please check your email for tickets... Check you spam folder if the email is not in your inbox",
                                icon: 'success',
                                type: "success",
                                confirmButtonText: "OK"
                            }).then(okay => {
                                if(okay){
                                    this.$router.push({ name: 'home' })
                                }
                            });

                        }else{
                            swal.fire({
                                title: "Oops!",
                                text: "That sucks.. Payment cancelled.",
                                icon: 'error',
                                type: "error",
                                confirmButtonText: "OK"
                            }).then(okay => {
                                if(okay){
                                    this.$router.push({ name: 'home' })
                                }
                            });

                        }
                    }).catch((error)=>{
                        swal.fire("Failed!", "There was something wrong in ticketsEmail  "+ error, "warning");
                    });

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
        },
        created(){
            if(this.$route.query.z14ea26b00ad9){
                
                this.verifyPayment(this.$route.query.z14ea26b00ad9);
                this.order_id = this.$route.query.z14ea26b00ad9;
            }
        
        },

    }
</script>
