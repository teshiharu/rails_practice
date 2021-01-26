<template lang="pug">
  #app.App
    .header
      .header_item
        router-link.link(:to="{ name: 'Home' }") Home
      .header_item
        router-link.link(:to="{ name: 'Sample' }") Sample
    .main
      router-view
</template>

<script>

export default {
  components: {
  },
  computed: {
  },
  mounted() {
  },
  methods: {
  }
}
</script>

<style lang="scss">
</style>

<style scoped lang="scss">
.App {
  & {
  }
  .main {
  }
}
</style>
