<template>
    <div class="container">
        {{eventData[0].event_details}}
    </div>
</template>

<script>
    export default {
        props: {
            eventData: Array
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
