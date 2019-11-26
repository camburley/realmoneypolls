class CreateMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :markets do |t|
      t.bigint "market_id"
      t.string "name"
      t.string "short_name"
      t.string "status"
      t.string "image"
      t.string "url"
      t.string "market_type"
 
      t.timestamps
    end
  end
end
