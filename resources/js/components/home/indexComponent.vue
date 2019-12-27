<template>
    <div>
        <loading :active.sync="isLoading" 
        :can-cancel="false" 
        :loader="'spinner'"
        :is-full-page="fullPage"
        :color="'#3490DC'"
        :height="150"
        :width="150"></loading>
        <slider :eventData="this.eventData"></slider>
        <catergories :eventData="this.eventData"></catergories>
        <catergories :eventData="this.eventData"></catergories>
    </div>

</template>

<script>
    export default {
       data(){
           return{
                eventData:[],
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
                    swal("Failed!", "There was something wrong in getEvents "+ error, "warning");
                    })
            },
       },
       created(){
            this.getEvents();
       }
    }
</script>
<style scoped>

</style>