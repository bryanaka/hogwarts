class CreateStudentsTable < ActiveRecord::Migration
  def change
    
    create_table :students do |t|
      t.string :name
      t.references :house
    end

  end
end
