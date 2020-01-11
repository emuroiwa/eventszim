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
                        <img class="d-block w-100" :src="event.event_img" :alt="event.event_name" height="600">
                        <div class="carousel-caption d-none d-md-block">
                            
                            <h2>{{event.event_name}}</h2>
                            <h3>{{event.start_date | myDate}}</h3>
                                
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
            console.log(isMobile)
        },
        data(){
            return{
                
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
    opacity: .27;
}

.carousel-control-prev{
    z-index: 3
}
.carousel-control-next{
    z-index: 3;
}

</style>

