class ApiController < ActionController::Base
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
    sleep(1)
    render(json: { animals: array })
  end
end
