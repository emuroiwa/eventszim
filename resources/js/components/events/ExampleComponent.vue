<template>
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
</template>

<script>
    export default {
        mounted() {
           // console.log('Component mounted.')
        },
        created(){
            //$(this).css('background-image','url(../images/compra_normal.png)');
        }
    }
</script>
<style scoped>

</style>
