<template>

        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="overlay"></div>
                    <img class="d-block w-100" src="img/slide.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h2>Testttttt</h2>
                        <h3>{{}}</h3>
                            <router-link :to="{ name: 'indexEvent', params: { id: 1 } }">
                                <button class="btn-lg btn-primary">
                                    Get tickets <i class="fas fa-ticket-alt"></i>
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
/* .carousel-caption {
    padding-bottom: 140px;
}  */
.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 2;
    background-image: linear-gradient(141deg,#db109e 0%, #1fc8db 51%, #2cb5e8 75%);
    opacity: .5;
}
.carousel-caption  {
    position: absolute;
    top: 56%;
    left: 50%;
    z-index: 3;
    color: #fff;
    text-align: center;
    text-transform: uppercase;
    text-shadow: 1px 1px 0 rgba(0,0,0,.75);
      -webkit-transform: translate3d(-50%,-50%,0);
         -moz-transform: translate3d(-50%,-50%,0);
          -ms-transform: translate3d(-50%,-50%,0);
           -o-transform: translate3d(-50%,-50%,0);
              transform: translate3d(-50%,-50%,0);
}
.carousel-caption  h2 {
    font-size: 4em;    
    font-weight: bold;
    margin: 0;
    padding: 0;
}


</style>

