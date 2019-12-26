<template>
    <div class="container">
        <h5>Price Categories</h5>
        <div class="card card-body border-primary" data-toggle="collapse" href="#priceCategory" role="button" aria-expanded="false" aria-controls="priceCategory">
                 <div class="row">
                    <div class="col-md-9">
                        Price Category<br>
                        Price
                    </div>
                    <div class="col-md-3">
                        <p>Status</p>
                    </div>
                </div>
        </div>
        <form @submit.prevent="">
            <div class="collapse mt-1" id="priceCategory">
                <div class="card card-body  border-primary">
                    <div class="row">
                        <div class="col-md-9">
                            10 Or More Dsc (Woc) R495.00<br>
                            Between 10 and 20 tickets.
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="tickects" @change="onChangeTickets($event)">
                                <option value="0">0</option>
                                <option value="0">0</option>
                                <option v-for="ticket in tickets" :key="ticket.id" :value="ticket.id" 
                                    :data-id="ticket.name"
                                    :data-id2="ticket.transaction_type">
                                        {{ ticket.default_description }}
                                    </option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="collapse mt-1" id="priceOverview">
                    <ul class="timeline">
                        <li>
                            <a target="_blank" href="https://www.totoprayogo.com/#">New Web Design</a>
                            <a href="#" class="float-right">21 March, 2014</a>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque diam non nisi semper, et elementum lorem ornare. Maecenas placerat facilisis mollis. Duis sagittis ligula in sodales vehicula....</p>
                        </li>
                        <li>
                            <button type="button" class="btn btn-warning" @click="checkAvaliablity">Check Avaliablity </button>
                        </li>
                    </ul>
                </div>
            </div>

        </form>
    </div>
</template>

<script>
    export default {
        props: {
            eventData: Object
        },
        data(){
            return{
                tickets:{}
                
            }
        },
        methods: {
            onChangeTickets(e){
                $('#priceOverview').collapse('show');
            },
            checkAvaliablity(){
                 swal("Failed!", "There was something wrong in getEvents ", "warning");
            }
        },
        created(){
            //this.getEvent();
        }
    }
</script>
<style scoped>
ul.timeline {
    list-style-type: none;
    position: relative;
}
ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 29px;
    width: 2px;
    height: 100%;
    z-index: 400;
}
ul.timeline > li {
    margin: 20px 0;
    padding-left: 20px;
}
ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #22c0e8;
    left: 20px;
    width: 20px;
    height: 20px;
    z-index: 400;
}

</style>
