class AddReferencesToContracts < ActiveRecord::Migration[5.2]
  def change
    change_table :contracts do |t|
      
      t.references :market
    
    end
  end
end
