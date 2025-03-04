<template>
  <div>
    <h2>Welcome, User!</h2>
    <p>This is a dynamic Vue component rendered in your Rails app.</p>

    <nav>
      <router-link to="/">Home</router-link> |
      <router-link to="/categories">Categories</router-link>
    </nav>
    
    <router-view></router-view>
  </div>
</template>

<script setup>
</script>
