<template lang="pug">
  .sample
    h1.heading Sample
    .count 動物リスト {{ animals.length }}匹
    br
    .loading(v-if="animals.length == 0") 読み込み中...
    .animal(v-for="animal in animals")
      .row id: {{ animal.id }}
      .row 体重: {{ animal.weight }}kg
      .row 名前: {{ animal.name }}kg
      hr

</template>

<script>
import axios from 'axios';
export default {
  components: {
  },
  mixins: [],
  computed: {
  },
  data() {
    return {
      animals: [],
    };
  },
  watch: {
  },
  created() {
  },
  mounted() {
    this.fetchAnimals();
  },
  methods: {
    async fetchAnimals() {
      const response = await axios.get('/api/sample');
      console.log(response);
      this.animals = response.data.animals;
    },
  },
}
</script>

<style scoped lang="scss">
.sample {
}
</style>
