<template>

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="img/slide.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block text-right">
                        <h5>Testttttt</h5>
                        <p>{{}}</p>
                            <router-link to="/test">
                                <button class="btn btn-primary">
                                    Get ticket <i class="fas fa-ticket-alt"></i>
                                </button>
                            </router-link>
                    </div>
                </div>
                
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>


</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        },
        data(){
            return{
                sliders:{},

            }
        },
        methods: {
            
        },
        created(){

        }
    }
</script>
<style scoped>
a{
    color: white !important;
}
</style>

