class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.bigint "user_id"
      t.string "name"
      t.string "image"
      t.boolean "admin", default: false
      t.timestamps
    end
  end
end
