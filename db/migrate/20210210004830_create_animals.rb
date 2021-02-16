class CreateAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :animals do |t|
      t.text :name
      t.integer :weight

      t.timestamps
    end
  end
end
