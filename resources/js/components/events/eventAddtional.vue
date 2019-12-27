<template>
    <div class="container">
        <p>
            <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                Link with href
            </a>
           
        </p>
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
            </div>
        </div>
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
