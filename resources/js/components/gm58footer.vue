<template>
    <div>
        <!-- Main Footer -->
            <footer id="sticky-footer" class="py-4 bg-info text-white-50 gm58-footer">
                <div class="container text-center">
                <small>Copyright &copy; Your Website</small>
                </div>
            </footer>

    </div>
</template>

<script>
    export default {

        data(){
            return{
                tickets:{},
                orders:{},
                 form: new Form({
                    quantity:'',
                    category_id:'',
                    }),
                
            }
        },
        methods: {

        },
        created(){
            //this.getEvent();
        }
    }
</script>