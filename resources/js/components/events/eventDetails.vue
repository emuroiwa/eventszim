<template>
    <div class="container">
        {{eventData.events[0].event_details}}
    </div>
</template>

<script>
    export default {
        props: {
            eventData: Object
        },
        data(){
            return{
                
            }
        },
        methods: {
            
        },
        created(){
            //this.getEvent();
        }
    }
</script>
<style scoped>

</style>
