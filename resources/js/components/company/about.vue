<template>
    <div>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header mb-1">Example Component</div>

                        <div class="card-body">
                            I'm an example component.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <gm58footer></gm58footer>
    </div>

</template>

<script>
    export default {
        mounted() {
           Fire.$emit('indexLoaded') 
        },
        created(){
            //$(this).css('background-image','url(../images/compra_normal.png)');
        }
    }
</script>
<style scoped>

</style>
