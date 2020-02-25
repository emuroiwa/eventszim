<template>
        <div class="container mb-4 mt-4">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header mb-1">TicketBook</div>

                        <div class="card-body">
                           <b>TicketBook</b>
                            Suite 202 Pollack House,<br> Robson Manyika,<br> Harare<br>

                           <b>Hotline +263 77 968 4593</b>
                        </div>
                    </div>
                </div>
            </div>
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
