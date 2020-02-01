<template>
<div>
    <h3 class="text-primary mt-2">Trending</h3>
    <div class="cards-list">
        
        <div  v-for="(event,idx) in eventData.events" :key="event.id" :class="{ active: idx==0 }">
            <router-link :to="{ path: 'indexEvent', query: { event: event.id } }">
                <div class="card 1">
                    <div class="card_image"> <img :src="event.event_img" :alt="event.event_name" /> </div>
                    <div class="card_title title-white">
                        <p>{{event.event_name}}</p>
                    </div>
                </div>
            </router-link>
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
.cards-list {
  z-index: 0;
  width: 100%;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}

.card {
  margin: 30px auto;
  width: 300px;
  height: 300px;
  border-radius: 40px;
box-shadow: 5px 5px 30px 7px rgba(0,0,0,0.25), -5px -5px 30px 7px rgba(0,0,0,0.22);
  cursor: pointer;
  transition: 0.4s;
}

.card .card_image {
  width: inherit;
  height: inherit;
  border-radius: 40px;
}

.card .card_image img {
  width: inherit;
  height: inherit;
  border-radius: 40px;
  object-fit: cover;
}
a:hover {
  
  text-decoration: none;
}
.card .card_title {
  text-align: center;
  border-radius: 0px 0px 40px 40px;
  font-family: sans-serif;
  font-weight: bold;
  font-size: 30px;
  margin-top: -90px;
  height: 40px;
}

.card:hover {
  transform: scale(0.9, 0.9);
  box-shadow: 5px 5px 30px 15px rgba(0,0,0,0.25), 
    -5px -5px 30px 15px rgba(0,0,0,0.22);
}

.title-white {
  color: white;
}

.title-black {
  color: black;
}

@media all and (max-width: 500px) {
  .card-list {
    /* On small screens, we are no longer using row direction but column */
    flex-direction: column;
  }
}
</style>
