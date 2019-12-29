<template>
    <div class="container">

        <form @submit.prevent="create()">
            <div class="row">

                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input v-model="form.fullname" type="text" name="fullname" placeholder="Full Name" class="form-control" :class="{ 'is-invalid': form.errors.has('fullname') }">
                    <has-error :form="form" field="fullname"></has-error>
                </div>

                <div class="form-group">
                    <label for="contact">Contact Number</label>
                    <input v-model="form.contact" type="number" name="contact" placeholder="Contact" class="form-control" :class="{ 'is-invalid': form.errors.has('contact') }">
                    <has-error :form="form" field="contact"></has-error>
                </div>

            </div>
            <div class="row">

                <div class="form-group">
                    <label for="email_ticket">Email To send tickets to</label>
                    <input v-model="form.email_ticket" type="email" name="email_ticket" placeholder="Full Name" class="form-control" :class="{ 'is-invalid': form.errors.has('email_ticket') }">
                    <has-error :form="form" field="email_ticket"></has-error>
                </div>

                <div class="form-group">
                    <label for="confirm_email">Confirm Email</label>
                    <input v-model="form.confirm_email" type="email" name="confirm_email" placeholder="confirm_email" class="form-control" :class="{ 'is-invalid': form.errors.has('confirm_email') }">
                    <has-error :form="form" field="confirm_email"></has-error>
                </div>
                
            </div>

 
        </form>
    </div>
</template>
<script>
    export default {

        data() {
            return {
                company:1,
                tax_period:1,
                locations : {},
                editmode:false,
                form: new Form({
                    location:'',
                    address:'',
                    street:'',
                    suburb:'',
                    country:'',
                    company:'',
                    currency_id:'',
                    }),
            }
        },
        methods: {
            getSelectedDetails(data,e){
                this.clearForm();
                this.editmode=true;
                this.form.fill(data);
                $('a').removeClass('active')
                $('input').removeClass('is-invalid');
                $(e.currentTarget).addClass('active')

            },
             clearForm(){
                this.form.reset();
                this.editmode=false;
                $('a').removeClass('active') ;              

                $('input').removeClass('is-invalid');
            },
            getData(){
                   if(this.$gate.isAdminOrAuthor()){
                    axios.get("api/locations").then(({ data }) => {
                        this.locations = data
                        }
                    );
                }
            },
                create(){
                    this.$Progress.start();
                    this.form.company = this.company;
                    this.form.calculated_on = JSON.stringify(this.value);
                    this.form.calc_on_type = this.picked;
                    this.form.tax_period = this.tax_period;
                
                    this.form.post('api/locations')
                    .then(()=>{
                        Fire.$emit('AfterCreate');
                        $('#addNew').modal('hide')

                        toast({
                            type: 'success',
                            title: 'Created in successfully'
                            })
                        this.$Progress.finish();
                        
                        this.getData();
                        this.clearForm();
                    })
                    .catch((error)=>{
                        console.log(error)
                        this.$Progress.fail();
                    })
                },            
            update(){
                this.$Progress.start();
                this.form.company = this.company;
                this.form.calculated_on = JSON.stringify(this.value);
                this.form.calc_on_type = this.picked;
                this.form.tax_period = this.tax_period;

                this.form.put('api/locations/'+this.form.id)
                .then(() => {
                    // success
                     swal(
                        'Updated!',
                        'Information has been updated.',
                        'success'
                        )
                        this.$Progress.finish();
                })
                .catch((error) => {
                    console.log(error)
                    this.$Progress.fail();
                });
            },
            getSelectedDetails(data,e){
                this.clearForm();
                this.editmode=true;
                this.form.fill(data);
                $('a').removeClass('active')
                $('input').removeClass('is-invalid');
                $(e.currentTarget).addClass('active')
                
                var calculated_on=JSON.parse(data.calculated_on);

                calculated_on.forEach(element => {
                    this.value.push(element)
                });
                
                this.picked=data.contri_calc_type
            },
        },
        computed: {

        },
        created() {
          this.getData()

        }

    }
</script>

