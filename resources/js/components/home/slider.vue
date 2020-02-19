<template>
    
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <!-- {{eventData.events}} -->
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators"  v-for="(event,idx) in eventData.events" :key="event.id" :class="{ active: idx==0 }" :data-slide-to="{idx}"></li>

            </ol>
            <div class="carousel-inner gm58-carousel-inner">
                <div class="carousel-item" v-for="(event,idx) in eventData.events" :key="event.id" :class="{ active: idx==0 }">
                    <router-link :to="{ path: 'indexEvent', query: { event: event.id } }">
                        <div class="overlay"></div>
                        <img v-if="isMobile && event.event_mobile_img" class="d-block w-100 gm58-slider img-fluid" :src="event.event_mobile_img" :alt="event.event_name">
                        <img v-else class="d-block w-100 gm58-slider img-fluid" :src="event.event_img" :alt="event.event_name">
                        <!-- <vue-responsive-image
                            :width-on-screen="100"
                            :width-on-screen-tablet="100"
                            :width-on-screen-smartphone="100"
                            :image-url="event.event_mobile_img"
                            :image-ratio="16/9"
                            :alt="event.event_name"
                            :image-class="'d-block gm58-slider'"
                            :mode="'all'"></vue-responsive-image> -->

                        <div class="carousel-caption d-none d-md-block">
                            
                            <h2>{{event.event_name}}</h2>
                            <h3 v-if="event.event_details != 'COMING SOON'">{{event.start_date | myDate}}</h3>
                            <h3 v-else>COMING SOON</h3>
                                
                                    <button class="btn btn-primary" v-if="isMobile">
                                        Get tickets <i class="fas fa-ticket-alt"></i> 
                                    </button>
                                    <button class="btn-lg btn-primary" v-else>
                                        Get tickets <i class="fas fa-ticket-alt"></i>
                                    </button>
                            
                        </div>
                     </router-link>
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
        props: {
            eventData: Object
        },
        data(){
            return {
                isMobile:false,
            }
        },
        computed:{
            totalDeductions: function(){
                 var sliders = this.eventData.filter(function(eventData) {
                    return eventData.is_slider = 0;
                    });
                
            },
           
        },
        mounted() {
            this.isMobile = window.matchMedia("only screen and (max-width: 760px)").matches;
            //console.log(this.isMobile)
        },
        
    }
</script>
<style scoped>
a {
    color: white !important;
}
/* .carousel-caption {
    padding-bottom: 140px;
}  */
.gm58-slider { 
    max-height: 650px;
    /* height:650px; */
    width: 100%;
  
}
.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 2;
    background-image: linear-gradient(141deg,#db109e 0%, #1fc8db 51%, #2cb5e8 75%);
    opacity: .27;
}

.carousel-control-prev {
    z-index: 3
}
.carousel-control-next {
    z-index: 3;
}

</style>

