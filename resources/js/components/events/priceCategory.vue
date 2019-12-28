<template>
    <div class="container">
        <h5>Price Categories</h5>
        <!-- <div class="card card-body border-primary" data-toggle="collapse" href="#priceCategory" role="button" aria-expanded="false" aria-controls="priceCategory">
                 <div class="row">
                    <div class="col-md-9">
                        Price Category<br>
                        Price
                    </div>
                    <div class="col-md-3">
                        <p>Status</p>
                    </div>
                </div>
        </div> -->
        <form @submit.prevent="">
            <!-- <div class="collapse mt-1" id="priceCategory"> -->
                <!-- {{eventData.events[0].price_categories}} -->
                <div class="card card-body  border-primary mt-1" v-for="event in eventData.events[0].price_categories" :key="event.id">
                    <div class="row">
                        <div class="col-md-6 font-weight-bold">
                            {{event.description}}
                        </div>
                        <div class="col-md-3">
                            <span class="badge badge-info">ZWL</span> {{event.price_zwl | formatNumber}}<br/>
                            <span class="badge badge-success">USD</span> {{event.price_usd | formatNumber }}<br/>
                        </div>
                        <div class="col-md-3">
                            <select class="form-control" id="tickects" @change="onChangeTickets($event)">
                                <option>0</option>
                                <option v-for="index in event.max_tickets" :key="index">{{index}}</option>
                               
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
            <!-- </div> -->

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
                 Fire.$emit('checkAvaliablity');
                 this.form.post('api/payslip')
                .then((data)=>{
                    Fire.$emit('AfterCreate');
                    $('#addNew1').modal('hide');

                    if(typeof data.data.message  != "undefined" && data.data.message=='fail'){
                         toast({
                            type: 'warning',
                            title: 'Payslip transaction already added'
                            })
                    }else{
                        this.reloadTransactions();
                        toast({
                            type: 'success',
                            title: 'Saved successfully'
                            })
                    }
                    this.$Progress.finish();

                })
                $('#priceOverview').collapse('show');
            },
            checkAvaliablity(){
               
                axios.get("api/payments").then(({ data }) => {
                        this.eventData = data;
                    }).catch((error)=>{
                    // console.log(rror.response)
                    swal("Failed!", "There was something wrong in getEvents "+ error, "warning");
                    })
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
