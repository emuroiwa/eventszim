@include('layouts.header')  

   <div id="app">

         <gm58header></gm58header>     
            <main id="main">
                <router-view></router-view>
            </main>
        <gm58footer></gm58footer>
    </div>

<script src="/js/app.js"></script>
</body>
</html>