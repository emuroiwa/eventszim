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
                            this.isLoading = false
                        }).catch((error)=>{
                            // console.log(rror.response)
                        swal.fire("Failed!", "There was something wrong in verifyPayment "+ error, "warning");
                        })

                }).catch((error)=>{
                    // console.log(rror.response)
                    swal("Failed!", "There was something wrong in getUserData "+ error, "warning");
                })
            },

            ticketsEmail(response,ref){
                console.log(this.userData)
                var emailType = ""
                var emailHeading = ""
                   if(response){
                       emailType = 'success';
                       emailHeading = ':-) Ticketbook Confimation of Ticket Purchase'

                   }else{
                       emailType = 'cancel'
                       emailHeading = ' :-( Ticketbook Cancellation of Ticket Purchase'
                   }
                   axios.post('api/sendemail', {
                    email: this.userData.email,
                    client_name: this.userData.fullname,
                    subject: emailHeading + this.order_id,
                    email_type: emailType,
                    order_id: this.order_id
                }).then((response) => {
                   swal.fire("Success", "zvinenge zvaita izvi hamuone kudaro ", "success");
                }).catch((error)=>{
                    // console.log(rror.response)
                swal.fire("Failed!", "There was something wrong in getUserData "+ error, "warning");
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
