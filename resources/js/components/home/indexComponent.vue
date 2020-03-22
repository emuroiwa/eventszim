<template>
    <div>
        <vue-element-loading :active="isActive" :is-full-screen="true" :size="'80'" :color="'#FF6700'"/>
        <slider :eventData="this.eventData"></slider>
        <new-catergories :eventData="this.eventData"></new-catergories>
        <!-- <catergories :eventData="this.eventData"></catergories> -->
        
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
               //COVID 19
                swal.fire({
                    title: "Covid 19",
                    text: "TicketBook wishes to inform you that all events on our site have been postpone due to the COVID 19 pandemic. If you have already registered and paid, your spot in the race will be secure- no further payments will be required when the event is rescheduled",
                    icon: 'info',
                    type: "info",
                    confirmButtonText: "OK"
                }).then(okay => {
                    if(okay){
                         window.open('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public', '_blank');
                    }
                });               
               this.isActive = true;
                 axios.get("api/events").then(({ data }) => {
                        this.eventData = data;
                        this.isActive = false;
                    }).catch((error)=>{
                    // console.log(rror.response)
                    swal.fire("Failed!", "There was something wrong in getEvents "+ error, "warning");
                    })
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