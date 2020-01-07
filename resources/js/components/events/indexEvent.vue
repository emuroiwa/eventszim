<template>
    <div>
        <div class="event" :style="{ 'background-image': 'url(' + eventData.events[0].event_img + ')' }">
            <div class="row gm58-event">
                
                <div class="col-md-5">
                    <div class="card h-100 border-primary mb-3">
                        <div class="card-header event-card-header mb-1">
                            <h4 class="card-title">BOOK YOUR TICKETS</h4>
                            <!-- <h5>Choose Venue & Date/Time</h5> -->
                        </div>
                        <div class="card-body">
                            <priceCategory :eventData="this.eventData"></priceCategory>
                        </div>
                            
                    </div> 
                </div>
                <div class="col-md-7">
                    <div class="card h-100 border-primary mb-3">
                        <div class="card-header event-card-header mb-1">
                            <h4 class="card-title">{{eventData.events[0].event_name}}</h4>
                        </div>
                        <div class="card-body">
                            <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Event Details</a>
                                </li>
                                
                                <!-- <li class="nav-item">
                                    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Additional Info</a>
                                </li> -->
                                <!-- <li class="nav-item">
                                    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Show Map</a>
                                </li> -->
                            </ul>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                    <eventDetails :eventData="this.eventData"></eventDetails>
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                    <eventAddtional :eventData="this.eventData"></eventAddtional>

                                </div>
                                <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                                    
                                </div>
                            </div>
                        </div>
                            
                    </div> 
                </div>
            </div>
        </div>
        <gm58footer></gm58footer>
    </div>

</template>

<script>
    export default {
         props: ['id'],
        data(){
            return{
                eventData:{}

            }
        },
        methods: {
             getEvent(){
                 axios.get("api/events/" + this.$route.query.event).then(({ data }) => {
                        this.eventData = data;
                    }).catch((error)=>{
                    // console.log(rror.response)
                    swal("Failed!", "There was something wrong in getEvents "+ error, "warning");
                    })
            },
            selectedEvent(){
                $('html, body').animate({
                    scrollTop: $("div.gm58-event").offset().top
                }, 1000)
            }
        },
        created(){

             Fire.$on('user',(user) =>{
                this.selectedEvent()
            });
            Fire.$emit('indexLoaded') 

            this.getEvent();
            $('.event').css('background-image','url(img/slide/event.jpg) !important');
        }
    }
</script>
<style scoped>
.event{
    /* background-image: url(https://content.computicket.com/site/mobile.computicket.com/peter_pan_ice_cover_image2_apr19rs.jpg); */
    background-position: center; /* Center the image */
    background-repeat: no-repeat; /* Do not repeat the image */
    background-size: cover; 
}
</style>
