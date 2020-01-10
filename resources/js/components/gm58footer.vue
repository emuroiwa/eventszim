<template>
    <div>
        <!-- Main Footer -->
            <footer id="sticky-footer" class="py-4 text-white-50 gm58-main-footer">
                <div class="container">
                    <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <!-- Sell Tickets-->
                        <section class="widget widget-light-skin">
                        <h3 class="widget-title">Sell Tickets With Us</h3>
                        <p class="text-white opacity-90">TicketBook is the leader in online ticket sales in Zimbabwe.</p>
                        <router-link to="/sell">
                            <button class="btn btn-primary" href="">Sell With Us</button>
                        </router-link>
                        </section>
                    </div>
                        <!-- Find Events-->
                    
                        <div class="col-lg-3 col-md-6">           
                            <section class="widget widget-links widget-light-skin">
                                <h3 class="widget-title">Find Events</h3>
                                <ul>
                                    <li><a href="#">Browse</a></li>

                                </ul>
                            </section>
                        </div>               
                    <div class="col-lg-3 col-md-6">
                        <!-- About Us-->
                        <section class="widget widget-links widget-light-skin">
                        <h3 class="widget-title">Help &amp; Info</h3>
                        <ul>
                            <li><router-link to="/terms">Terms and Condtions</router-link ></li>
                            <li><router-link to="/help">Get Help</router-link ></li>
                            <li><router-link to="/help">FAQs</router-link ></li>
                            <li><router-link to="/about">About us</router-link ></li>
                            <li><router-link to="/contact">Contact us</router-link ></li>
                        </ul>
                        </section>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <!-- My Account-->
                        <section class="widget widget-links widget-light-skin">
                        <h3 class="widget-title">My Account</h3>
                        <ul>
                            <li><a href="#">My Profile</a></li>
                            <li><a href="#">My Tickets</a></li>
                            <li><a href="#">My Alerts</a></li>
                            <!--
                            <li><a href="#">My Alerts</a></li>
                            <li><a href="#">My Location</a></li>
                            <li><a href="#">My Gift Vouchers</a></li>-->
                        </ul>
                        </section>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <!-- Follow Us-->
                        <section class="widget widget-light-skin">
                        <h3 class="widget-title">Follow Us For Updates</h3><a class="social-button shape-circle sb-facebook sb-light-skin" target="_blank" href="https://www.facebook.com/gm58" data-toggle="tooltip" title="" data-original-title="Facebook"><i class="fab fa-facebook-f"></i></a>
                            <a class="social-button shape-circle sb-twitter sb-light-skin" href="https://twitter.com/gm58" target="_blank" data-toggle="tooltip" title="" data-original-title="Twitter"><i class="fab fa-twitter"></i></a>
                            <a class="social-button shape-circle sb-instagram sb-light-skin" href="https://www.instagram.com/gm58/" target="_blank" data-toggle="tooltip" title="" data-original-title="Instagram"><i class="fab fa-instagram"></i></a>
                        </section>
                    </div>
                    <div style="display:none;" class="col-lg-9 col-md-6">
                        <!-- Subscription hide for now-->
                        <section class="widget widget-links widget-light-skin">
                        <h3 class="widget-title">Get The Best Events In Your Inbox</h3>
                        <div class="row">
                            <div class="col-lg-4">
                                <p class="text-white opacity-90">Subscribe to our Newsletter to receive early discount offers, latest news, sales and promo information.</p>
                                <a href="http://eepurl.com/gDCfAP" target="_blank" class="btn btn-primary"> <i class="fas fa-check"></i> Sign up</a>
                            </div>
                            <div class="col-lg-8">
                                <!--
                                <form class="subscribe-form" action="#">
                                    <div class="clearfix">
                                    <div class="input-group">
                                        <input class="form-control" type="email" name="email" placeholder="Your email address"><span class="input-group-addon"><i class="fas fa-envelope-open"></i></span>
                                    </div>
                                    <button class="btn btn-primary" type="submit"><i class="fas fa-check"></i></button>
                                    </div>
                                </form>
                                -->
                            </div>
                        </div>
                        </section>
                    </div>
                    </div>
                    <section class="widget widget-light-skin">
                    <h3 class="widget-title">Safe &amp; Secure</h3>
                    <div class="row">
                        <div class="col-lg-3 col-md-5 padding-bottom-1x">
                        <p class="text-white opacity-90">We accept Ecocash and OneMoney mobile money payments as well as all major credit cards, as well as Visa Checkout, Masterpass and </p>
                        </div>
                        <div class="col-lg-9 col-md-7 padding-bottom-1x">
                        <!-- Payment Methods-->
                        <div class="pt-2 margin-bottom-1x"><img :src="'/img/paymentlogo/payments.png'" alt="Payment Methods">
                        </div>
                        </div>
                    </div>
                        
                    </section>
                    <!-- Copyright-->
                    <p class="footer-copyright">© All content is property of GM58</p>
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