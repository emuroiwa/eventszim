<template>
        <div class="container mb-4 mt-4">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header mb-1">TicketBook</div>

                        <div class="card-body">
                            TicketBook is the leader in online ticket sales in Zimbabwe.We accept Ecocash and OneMoney mobile money payments as well as all major credit cards, as well as Visa Checkout, Masterpass and
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
