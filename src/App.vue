<template>
  <div id="app">
     <router-view :key="$route.fullPath"></router-view>
  </div>
</template>

<script>


export default {
  name: 'App',
  components: {
    
  }
}
</script>

<style>
@import "./assets/css/reset.css";  
#app {
  min-width: 1050px;
}
</style>

