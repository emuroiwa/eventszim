<template>
    <div>
        <loading :active.sync="isLoading" 
        :can-cancel="false" 
        :loader="'spinner'"
        :is-full-page="fullPage"
        :color="'#3490DC'"
        :height="150"
        :width="150" class="text-center"></loading>
        <slider :eventData="this.eventData"></slider>
        <catergories :eventData="this.eventData"></catergories>
        <!-- <catergories :eventData="this.eventData"></catergories> -->
        <gm58footer></gm58footer>
    </div>

</template>

<script>
    export default {
       data(){
           return{
                eventData:{},
                isLoading: false,
                fullPage: true,
           }
       },
       methods: {
           
           getEvents(){
               this.isLoading = true;
                 axios.get("api/events").then(({ data }) => {
                        this.eventData = data;
                        this.isLoading = false;
                    }).catch((error)=>{
                    // console.log(rror.response)
                    swal.fire("Failed!", "There was something wrong in getEvents "+ error, "warning");
                    })
            },
            verifyPayment(ref){
                this.ticketsEmail('data')
                axios.get("api/paynow/"+ ref).then(({ data }) => {
                    this.ticketsEmail(data)
                }).catch((error)=>{
                    // console.log(rror.response)
                swal.fire("Failed!", "There was something wrong in getCartItems "+ error, "warning");
                })
            },
            ticketsEmail(response){
                   axios.post('api/sendemail', {
                    email: 'emuroiwa@gmail.com',
                    client_name: 'Test',
                    subject: 'Test'
                }).then((response) => {
                   swal.fire("Failed!", "There was something wrong in ticketsEmail "+ error, "warning");
                });
            },
       },
       created(){
            Fire.$emit('indexLoaded') 
            this.getEvents();
            if(this.$route.query.z14ea26b00ad9){
                this.verifyPayment(this.$route.query.z14ea26b00ad9)
            }
       }
    }
</script>
<style scoped>

</style>