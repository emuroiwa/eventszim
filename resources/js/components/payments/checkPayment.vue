<template>
    <div class="container">
            
        <loading :active.sync="isLoading" 
        :can-cancel="false" 
        :loader="'spinner'"
        :is-full-page="fullPage"
        :color="'#3490DC'"
        :height="150"
        :width="150" class="text-center"></loading>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Payment processing</div>

                    <div class="card-body">
                        Please dont do anything
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
                
                axios.get("api/customers/" + this.getCookie('gm58baba')).then(({ data }) => {
                    this.userData = data;

                        
                        axios.get("api/paynow/"+ ref).then(({ data }) => {
                            this.ticketsEmail(data,ref)
                            
                        }).catch((error)=>{
                            console.log(error)
                        swal.fire("Failed!", "There was something wrong in verifyPayment "+ error.exception, "warning");
                        })

                }).catch((error)=>{
                    // console.log(rror.response)
                    swal("Failed!", "There was something wrong in getUserData "+ error, "warning");
                })
            },

            ticketsEmail(response,ref){
                
                var emailType = ""
                var emailHeading = ""
                var paymentResponse = response.message;
                   if(paymentResponse == 'done'){
                       emailType = 'success';
                       emailHeading = ':-) Ticketbook Confimation of Ticket Purchase'

                   }else{
                       emailType = 'cancel'
                       emailHeading = ' :-( Ticketbook Cancellation of Ticket Purchase'
                   }
                   axios.post('api/sendemail', {
                    email:'emuroiwa@gmail.com',
                    client_name: this.userData.fullname,
                    subject: emailHeading + this.order_id,
                    email_type: emailType,
                    order_id: this.order_id
                }).then((response) => {
                    this.isLoading = false
                    if(paymentResponse == 'done'){
                        swal.fire("Success", "Thank you for your purchase, please check your email for tickets", "success");
                    }else{
                        swal.fire("Oops", "Payment cancelled.....", "error");
                    }
                }).catch((error)=>{
                    // console.log(rror.response)
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
