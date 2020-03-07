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