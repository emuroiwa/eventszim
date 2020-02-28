<template>
    <div class="container gm58-parent">
        {{eventData.events[0].event_details}}

        <div class="gm58-bottom row  mt-4">
            <h3 v-if="eventData.events[0].website || eventData.events[0].instagram || eventData.events[0].facebook || eventData.events[0].whatsapp || eventData.events[0].whatsapp ">Follow this event</h3>
            <div class="icon-bar">
                <a :href="eventData.events[0].instagram" target="_blank" v-if="eventData.events[0].instagram">
                    <img class="gm58_icon" :src="'img/socials/instagram.png'" :alt="'instagram'">
                </a> 
                <a :href="eventData.events[0].twitter" target="_blank" v-if="eventData.events[0].twitter">
                    <img class="gm58_icon" :src="'img/socials/twitter.png'" :alt="'twitter'">
                </a> 
                <a :href="eventData.events[0].facebook" target="_blank" v-if="eventData.events[0].facebook">
                    <img class="gm58_icon" :src="'img/socials/facebook.png'" :alt="'facebook'">
                </a> 
                <a :href="'https://wa.me/' + eventData.events[0].whatsapp" target="_blank" v-if="eventData.events[0].whatsapp">
                    <img class="gm58_icon" :src="'img/socials/whatsapp.png'" :alt="'whatsapp'">
                </a> 
                <a :href="eventData.events[0].website" target="_blank" v-if="eventData.events[0].website">
                    <img class="gm58_icon" :src="'img/socials/seo-and-web.png'" :alt="'website'">
                </a> 

            </div>
        </div>
    </div>
</template>

<script>
    export default {
        props: {
            eventData: Object
        },
        data(){
            return{
                
            }
        },
        methods: {
            
        },
        created(){
            //this.getEvent();
        }
    }
</script>
<style scoped>

.icon-bar {
  width: 100%;
  height: 50%;
  background-color: #fff;
  overflow: auto;
}

.gm58_icon {
    width: 50px
}

.icon-bar a {
  float: left;
  width: 20%;
  text-align: center;
  padding: 12px 0;
  transition: all 0.3s ease;
  color: white;
  font-size: 14px;
}

.icon-bar img:hover {
    -webkit-transform: scale(1.10);
    -ms-transform: scale(1.10);
    transform: scale(1.10);

    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 #1fc8db;
}

.active {
  background-color: #4CAF50;
}
.gm58-parent {
  display: flex;
  flex-direction: column;
 
}
.gm58-bottom {
  margin-top: auto;
 
}
</style>
