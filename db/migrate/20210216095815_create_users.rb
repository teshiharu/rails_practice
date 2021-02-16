class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :mail
      t.string :password
      t.string :name

      t.timestamps
    end
  end
end
