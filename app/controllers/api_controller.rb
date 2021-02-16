class ApiController < ActionController::Base

  # この↓一文がないとCSRFチェックでこけるので、APIをやりとりしているControllerには必要
  # skip_before_filter :verify_authenticity_token # ←でもこれ入れたら500エラー出て表示されなくなったぞ？

  def sample
    array = [
      {
        id: 1,
        weight: 160,
        name: 'ゴリラ',
      },
      {
        id: 2,
        weight: 2300,
        name: 'シロサイ',
      },
      {
        id: 3,
        weight: 450,
        name: 'イリエワニ',
      },
      {
        id: 4,
        weight: 1000,
        name: 'キリン',
      },
    ]
    sleep(1) # 敢えて遅延させている
    render(json: { animals: array })
  end

  def index
    animals_all = Animal.all # レコード全取得
    sleep(1) # 敢えて遅延させている
    render(json: { animals: animals_all })
  end

  # カラのAnimalモデルをインスタンス化→Vueから受け取った内容をブチ込んで保存
  def create

    # ここ参考に作ってる (→ https://bit.ly/3qnDn9z)
    # ①Vueから値受け取る → 変数json_requestに格納
    json_request = JSON.parse(request.body.read)

    # [イケてない例：自力パース] === === ===
    # name = json_request["name"] # 返ってくるjsonがどういう構造かによる
    # weight = json_request["weight"] # 返ってくるjsonがどういう構造かによる

    # [イケてる例：params] === === ===
    name = params[:name]
    weight = params[:weight]

    # ②受け取った値を元にAnimalのインスタンス作成
    newAnimal = Animal.new() # Animalモデルをインスタンス化
    newAnimal.name = name # 値ブチ込み
    newAnimal.weight = weight # 値ブチ込み
    
    # ③保存
    if newAnimal.save
      obj = {
        msg: 'success !!',
        newAnimal: {
          name: name,
          weight: weight,
        },
      }
      render(json: obj, status: 200)
    else
      render(json: { msg: 'failed ...' }, status: 500)
    end

  end
end
