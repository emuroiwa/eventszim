@include('layouts.header')  

   <div id="app">

         <gm58header></gm58header>     
            <main id="main">
                <vue-page-transition name="fade-in-right">
                    <router-view></router-view>
                </transition>
            </main>
        <gm58footer></gm58footer>
    </div>

<script src="/js/app.js"></script>
</body>
</html>