<template>
<div class="top-content">
    <div class="container-fluid catergory-container">
        <h3 class="text-primary">Trending</h3>
        <div id="carousel-example" class="carousel slide" data-ride="carousel" data-interval="false">
            <div class="carousel-inner row w-100 mx-auto" role="listbox">
                <div class="carousel-item gm58-slider-item" v-for="(event,idx) in eventData.events" :key="event.id" :class="{ active: idx==0 }">
                    <router-link :to="{ path: 'indexEvent', query: { event: event.id } }">
                        <div class="card grow gm58-slider-card" >
                            <div> 
                                <!-- <div class="overlay"></div> -->
                                <img class="card-img-top" :src="event.event_img" :alt="event.event_name">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">{{event.event_name}} </h5>
                                <h5 class="card-title  text-center mt-1">{{event.venue}}</h5>
                                <p class="card-text  text-center">{{event.start_date | myDate}}</p>
                            </div>
                            <div class="card-footer gm58-footer footer-caption">
                                From {{event.price_categories[0].price_usd | formatNumber}}
                            </div>
                        </div>
                    </router-link>
                </div>

            </div>
            <a class="carousel-control-prev" href="#carousel-example" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carousel-example" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>


</template>

<script>
  // require styles from slick-carousel
 

  export default {
        props: {
            eventData: Object
        },
        data(){
            return {
               
            }
        },
        methods: {
            
            pageSlider(){

            
                $('#carousel-example').on('slide.bs.carousel', function (e) {
                    /*
                        CC 2.0 License Iatek LLC 2018 - Attribution required
                    */
                    var $e = $(e.relatedTarget);
                    var idx = $e.index();
                    var itemsPerSlide = 6;
                    var totalItems = $('.carousel-item').length;
                
                    if (idx >= totalItems-(itemsPerSlide-1)) {
                        var it = itemsPerSlide - (totalItems - idx);
                        for (var i=0; i<it; i++) {
                            // append slides to end
                            if (e.direction=="left") {
                                $('.carousel-item').eq(i).appendTo('.carousel-inner');
                            }
                            else {
                                $('.carousel-item').eq(0).appendTo('.carousel-inner');
                            }
                        }
                    }
                });
            }, 
        },
        created(){
            this.pageSlider();

        }              

        
  }
</script>
<style scoped>
.footer-caption{
    color: #fff;
    text-align: center;
    text-transform: uppercase;
    font-size: 1.4em;    
    font-weight: bold;
}
.grow:hover
{
        -webkit-transform: scale(1.05);
        -ms-transform: scale(1.05);
        transform: scale(1.05);
}
a:hover{
     color: #000 !important;
     text-decoration: none !important;
}
a{
     color: #000 !important;
     text-decoration: none !important;
}
.overlay {
    position: absolute;
    width: 100%;
    height: 100%;
    z-index: 2;
    background-image: linear-gradient(141deg,#db109e 45%, #fff 0%, #fff 75%);
    opacity: .1;
}
@media (min-width: 768px) and (max-width: 991px) {
    /* Show 4th slide on md if col-md-4*/
    .carousel-inner .active.col-md-4.carousel-item + .carousel-item + .carousel-item + .carousel-item {
        position: absolute;
        top: 0;
        right: -33.3333%;  /*change this with javascript in the future*/
        z-index: -1;
        display: block;
        visibility: visible;
    }
}
@media (min-width: 576px) and (max-width: 768px) {
    /* Show 3rd slide on sm if col-sm-6*/
    .carousel-inner .active.col-sm-6.carousel-item + .carousel-item + .carousel-item {
        position: absolute;
        top: 0;
        right: -50%;  /*change this with javascript in the future*/
        z-index: -1;
        display: block;
        visibility: visible;
    }
}
@media (min-width: 576px) {
    .carousel-item {
        margin-right: 0;
    }
    /* show 2 items */
    .carousel-inner .active + .carousel-item {
        display: block;
    }
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left),
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item {
        transition: none;
    }
    .carousel-inner .carousel-item-next {
        position: relative;
        transform: translate3d(0, 0, 0);
    }
    /* left or forward direction */
    .active.carousel-item-left + .carousel-item-next.carousel-item-left,
    .carousel-item-next.carousel-item-left + .carousel-item,
    .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(-100%, 0, 0);
        visibility: visible;
    }
    /* farthest right hidden item must be also positioned for animations */
    .carousel-inner .carousel-item-prev.carousel-item-right {
        position: absolute;
        top: 0;
        left: 0;
        z-index: -1;
        display: block;
        visibility: visible;
    }
    /* right or prev direction */
    .active.carousel-item-right + .carousel-item-prev.carousel-item-right,
    .carousel-item-prev.carousel-item-right + .carousel-item,
    .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(100%, 0, 0);
        visibility: visible;
        display: block;
        visibility: visible;
    }
}
/* MD */
@media (min-width: 768px) {
    /* show 3rd of 3 item slide */
    .carousel-inner .active + .carousel-item + .carousel-item {
        display: block;
    }
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item {
        transition: none;
    }
    .carousel-inner .carousel-item-next {
        position: relative;
        transform: translate3d(0, 0, 0);
    }
    /* left or forward direction */
    .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(-100%, 0, 0);
        visibility: visible;
    }
    /* right or prev direction */
    .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(100%, 0, 0);
        visibility: visible;
        display: block;
        visibility: visible;
    }
}
/* LG */
@media (min-width: 991px) {
    /* show 4th item */
    .carousel-inner .active + .carousel-item + .carousel-item + .carousel-item {
        display: block;
    }
    .carousel-inner .carousel-item.active:not(.carousel-item-right):not(.carousel-item-left) + .carousel-item + .carousel-item + .carousel-item {
        transition: none;
    }
    /* Show 5th slide on lg if col-lg-3 */
    .carousel-inner .active.gm58-slider-item.carousel-item + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
        /* position: absolute; */
        top: 0;
          /*change this with javascript in the future*/
        /* z-index: -1; */
        display: block;
        visibility: visible;
    }
    /* left or forward direction */
    .carousel-item-next.carousel-item-left + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(-100%, 0, 0);
        visibility: visible;
    }
    /* right or prev direction //t - previous slide direction last item animation fix */
    .carousel-item-prev.carousel-item-right + .carousel-item + .carousel-item + .carousel-item + .carousel-item {
        position: relative;
        transform: translate3d(100%, 0, 0);
        visibility: visible;
        display: block;
        visibility: visible;
    }
    .carousel-control-prev{
        background-image: linear-gradient(-90deg, transparent , #1fc8db);
        width: 70;
    }
    .carousel-control-next{
        background-image: linear-gradient(90deg, transparent , #1fc8db);
        width: 70;  
    }
}
</style>
