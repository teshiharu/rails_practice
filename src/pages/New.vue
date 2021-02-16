<template>
  <div>
    <h1>New</h1>
    <p>Name : <input type="text" v-model="name"></p>
    <p>Weight : <input type="number" v-model="weight"></p>
    <button @click="postNewAnimal">Submit</button>
  </div>
</template>

<script>
import axios from 'axios'; //axiosを使う準備

//他のファイルでimportされたときの戻り値
export default {
  components: {
  },
  mixins: [],
  computed: {
  },
  data() {
    return {
      name : '',
      weight : 0
    };
  },
  watch: {
  },
  created() {
  },
  mounted() {
  },
  methods: {
    postNewAnimal(){

      if(this.name === '' || this.weight === 0){
        alert('未入力欄あり')
        return
      }

      let vm = this //Vueインスタンスを変数vmに格納しておく
      const endpoint = '/api/new' //Railsのapi#createを呼ぶ
      axios.post(endpoint, {

          //失敗
          // name: this.name,
          // weight: this.weight,

          //成功
          name: vm.name,
          weight: vm.weight,
        })
        .then(function (response) { //処理うまく行ったパターン
          console.log(response);

          let msg = '保存に成功しました！' + '\n' + 
                    'name : ' + vm.name + '\n' + 
                    'weight : ' + vm.weight
          alert(msg)

          vm.name = ''
          vm.weight = 0
        })
        .catch(function (error) { //処理うまくいかなかったパターン
          console.log(error);

          alert('保存に失敗しました...')
        });
    }
  },
}
</script>

<style scoped lang="scss">

</style>
