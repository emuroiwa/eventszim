<template>
<div class="top-content">
    <div class="container-fluid catergory-container">
        <h3 class="text-primary">Trending</h3>
<div class="owl-carousel owl-theme">
  <div class="carousel-item">
    <a href="#">
      <div class="carousel-item-image">
        <img src="https://f.i.uol.com.br/fotografia/2016/03/11/594620-970x600-1.jpeg" class="item-image">
      </div>
      <div class="carousel-item-text">
        <span class="item-kicker">Restaurante de São Paulo</span>
        <h3 class="item-title">Mani</h3>
      </div>
    </a>
  </div>
  <div class="carousel-item">
    <a href="#">
      <div class="carousel-item-image">
        <img src="https://f.i.uol.com.br/fotografia/2016/03/11/594616-970x600-1.jpeg" class="item-image">
      </div>
      <div class="carousel-item-text">
        <span class="item-kicker">Restaurante de São Paulo</span>
        <h3 class="item-title">Tordesilhas</h3>
      </div>
    </a>
  </div>
  <div class="carousel-item">
    <a href="#">
      <div class="carousel-item-image">
        <img src="https://f.i.uol.com.br/fotografia/2016/03/11/594617-970x600-1.jpeg" class="item-image">
      </div>
      <div class="carousel-item-text">
        <span class="item-kicker">Restaurante que você já foi</span>
        <h3 class="item-title">Bar do Luiz Fernandes</h3>
      </div>
    </a>
  </div>
  <div class="carousel-item">
    <a href="#">
      <div class="carousel-item-image">
        <img src="https://f.i.uol.com.br/fotografia/2016/03/11/594619-970x600-1.jpeg" class="item-image">
      </div>
      <div class="carousel-item-text">
        <span class="item-kicker">Para ir a dois</span>
        <h3 class="item-title">A Figueira Rubaiyat</h3>
      </div>
    </a>
  </div>
  <div class="carousel-item">
    <a href="#">
      <div class="carousel-item-image">
        <img src="https://f.i.uol.com.br/fotografia/2016/03/11/594618-970x600-1.jpeg" class="item-image">
      </div>
      <div class="carousel-item-text">
        <span class="item-kicker">Coxinha</span>
        <h3 class="item-title">Ragazzo</h3>
      </div>
    </a>
  </div>
  <div class="carousel-item">
    <a href="#">
      <div class="carousel-item-image">
        <img src="https://f.i.uol.com.br/fotografia/2016/03/11/594615-970x600-1.jpeg" class="item-image">
      </div>
      <div class="carousel-item-text">
        <span class="item-kicker">Cafeteria</span>
        <h3 class="item-title">Starbucks</h3>
      </div>
    </a>
  </div>
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
            
            pageSlider() {

            
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
        created() {
            this.pageSlider();

        }              

        
  }
</script>
<style scoped>
/* Carousel */

.owl-carousel .carousel-item {
  background: #fff;
  border: 1px solid #D9D7DA;
  text-align: center;
}

.owl-carousel .carousel-item-text {
  padding: 12px;
}

.owl-carousel .carousel-item .item-kicker {
  color: #9A5053;
  display: block;
  font-size: .8em;
  font-weight: 600;
  height: 30px;
  margin-bottom: 16px;
  overflow: hidden;
  text-transform: uppercase;
}

.owl-carousel .carousel-item .item-title {
  color: #646464;
  font-size: 1em;
  font-weight: 600;
  height: 38px;
  margin: 0;
  overflow: hidden;
}

.owl-dots {
  margin-top: 40px;
  text-align: center;
  width: 100%;
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  -ms-backface-visibility: hidden;
  backface-visibility: hidden;
}

.owl-dot {
  border-radius: 50px;
  height: 10px;
  width: 10px;
  display: inline-block;
  background: rgba(127, 127, 127, 0.5);
  margin-left: 5px;
  margin-right: 5px;
}

.owl-dot.active {
  background: rgba(127, 127, 127, 1);
}


/* Tabs */

.nav-tabs {
  list-style: none;
  margin: 0;
  padding: 0;
  width: 100%;
}

.nav-tabs>li {
  display: block;
  position: relative;
  text-align: center;
}

.nav-tabs>li:last-child {
  margin-right: 0;
}

.tab-content {
  display: inline-block;
  width: 100%;
}

.tab-content .tab-pane {
  display: none;
}

.tab-content .tab-pane.active {
  display: block;
}
/*  */
</style>
