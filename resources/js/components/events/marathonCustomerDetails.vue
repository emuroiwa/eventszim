<template>
    <div>
        <form @submit.prevent="submitTicket()">
            <div class="card card-body border-warning mt-1" v-for="(ticketDetails, index) in  ticketDetails" :key="ticketDetails.id" >
                <h5> Complete Details </h5> <b> {{ticketDetails.event}} Ticket {{index +1}} </b>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="fullname"><b>Full Name</b> </label>
                            <input v-model="ticketDetails.fullname" type="text" name="ticketDetails[][fullname]" class="form-control"  required>
                           
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="contact"><b>Contact Number</b>*</label>
                            <input v-model="ticketDetails.contact" type="number" name="ticketDetails[][contact]" maxlength="10" minlength="10" placeholder="eg 0771111111" class="form-control"  required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pack"><b>Gender</b>*</label>
                            <select name="ticketDetails[][gender]" v-model="ticketDetails.gender" class="form-control" required>
                                <option value="">Please select </option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="category"><b>Race Category</b>*</label>
                            <select name="ticketDetails[][category]" v-model="ticketDetails.category" class="form-control" required>
                                <option value="">Please select </option>
                                <option v-if="ticketDetails.event_id!=12">Junior Under 18</option>
                                <option>Open (18 - 39)</option>
                                <option>Veteran (40 - 49)</option>
                                <option>Master (50 - 59)</option>
                                <option> Grandmaster (60 and above)</option>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="pack"><b>Race Pack Pickup</b>*</label>
                            <select name="ticketDetails[][pack]" v-model="ticketDetails.pack" class="form-control" required>
                                <option value="">Please select </option>
                                <option>PPC Harare office</option>
                                <option>PPC Bulawayo Office</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group m-2" v-if="ticketDetails.length>0">
                <input v-model="ticketDetails.event_id" name="ticketDetails[][event_id]" type="text" class="gm58hack">
                <button  type="submit" class="btn btn-primary is-mobile-btn" ><i class="fas fa-save"></i> Save Details</button>
                <a href="#" class="text-danger"  @click="cancelOrder()"><i class="fas fa-ban"></i> Cancel</a>
            </div>
        </form>
    </div>
</template>

<script>
    export default {

        data() {
            return {
                isLoading: false,
                fullPage: true,
                email:'',
                contact:'',
                setTicketsHasRun:false,
                ticketDetail: {
                    fullname: '',
                    contact: '',
                    email:'',
                    tshirtsize:'',
                    gender:'',
                    pack:'',
                    category:'',
                    event:'',
                    event_id:''
                    }, 
                ticketDetails:[]

            }
        },
        methods:{
            cancelOrder() {
                Fire.$emit('cancelOrder','marathon');
                //$('#shoppingCartModal').modal('hide');
                this.paymentMethod="";
            },
            submitTicket() {
                    this.setCookie("isMarathon", 'false', 1);
                    axios.post('api/customers', {
                        ticketDetails:this.ticketDetails,
                        user_id: this.getCookie("gm58baba")
                       
                    }).then((response) => {
                        Fire.$emit('marathonSaved');
                        swal.fire("Success!", "Ticket data added and item added to cart ", "success");
                    }).catch((error)=>{
                        swal.fire("Failed!", "There was something wrong in submitTicket "+ error, "warning");
                    });
                
            },
            setCookie(cname, cvalue, exdays) {
                var d = new Date();
                d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
                var expires = "expires="+d.toUTCString();
                document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
            },
            getCookie(cname) {
                var name = cname + "=";
                var decodedCookie = decodeURIComponent(document.cookie);
                var ca = decodedCookie.split(';');
                for(var i = 0; i <ca.length; i++) {
                    var c = ca[i];
                    while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                    }
                }
                return "";
            },
            getOrders() { 
                var user = this.getCookie('gm58baba');
                axios.get("api/marathons/"+ user).then(({ data }) => {
                        this.orders = data;
                        this.setTickets(data);
                    }).catch((error)=>{
                        console.log(error)
                })
            },

            setTickets(orders) {
                for (var i = 0; i < orders.length; i++) {
                        if(orders[i].user_id === null){
                                var addDetails = 0;
                                var orderQty = orders[i].quantity ;
                                var event_name = orders[i].event_name;
                                var description = orders[i].description;
                                var catID = orders[i].catID;
                            
                            for (var ix = 0; ix < orderQty; ix++) {
                                    var obj = {};
                                    obj['fullname'] = '';
                                    obj['contact'] = '';
                                    obj['category'] = '';
                                    obj['pack'] = '';
                                    obj['tshirtsize'] = '';
                                    obj['gender'] = '';
                                    obj['event'] = event_name +" "+ description ;
                                    obj['event_id'] = catID ;
                                    this.ticketDetails.push(obj);
                            }
                        }
                    }
                }
        },
    created(){
        this.getOrders()
    }

    }
</script>
<style scoped>


input.gm58hack {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: -internal-light-dark-color(white, white);
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: -internal-light-dark-color(white, white);
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 0.1px Arial;
    padding: 1px 0px;
    border-width: 0px;
    border-style: inset;
    border-color: white;
    border-image: initial;
}
</style>
