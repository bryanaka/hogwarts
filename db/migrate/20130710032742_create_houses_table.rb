class CreateHousesTable < ActiveRecord::Migration
  def change
    
    create_table :houses do |t|
      t.string :name
    end

  end
end
