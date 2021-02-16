<template>
  <div>
    <h1>Index</h1>
    <div class="loading" v-if="animals.length == 0">読み込み中...</div>
    <div class="animal" v-for="animal in animals">
      <div class="row">id : {{ animal.id }}</div>
      <div class="row">体重：{{ animal.weight }}kg</div>
      <div class="row">名前：{{ animal.name }}</div>
      <hr>
    </div>
  </div>
</template>

<script>
import axios from 'axios'; //axiosを使う準備

//他のファイルでimportされたときに戻り値
export default {
  components: {
  },
  mixins: [],
  computed: {
  },
  data() {
    return {
      animals: [] //APIから受け取った動物の配列データを格納しておく為の変数
    };
  },
  watch: {
  },
  created() {
  },
  mounted() {
    // ここにapiからデータ引っ張ってくる処理書く
    this.fetchAnimals()
  },
  methods: {
    async fetchAnimals() {
      const response = await axios.get('/api/index')
      console.log(response)
      this.animals = response.data.animals

      console.log(this.animals)
    },
  },
}
</script>

<style scoped lang="scss">

</style>
