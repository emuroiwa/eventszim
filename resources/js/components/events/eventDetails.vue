<template>
    <div class="container">
        {{eventData.description}}
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
