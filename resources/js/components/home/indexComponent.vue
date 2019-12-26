<template>
    <div>
        <slider :eventData="this.eventData"></slider>
        <catergories :eventData="this.eventData"></catergories>
        <thisWeek :eventData="this.eventData"></thisWeek>
    </div>

</template>

<script>
    export default {
       data(){
           return{
                eventData:[],
           }
       },
       methods: {
           getEvents(){
                 axios.get("api/events").then(({ data }) => {
                        this.eventData = data;
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