class CreateCamp < ActiveRecord::Migration[5.0]
  def change
    create_table :camps do |t|
      t.text :camp_name
    end 
  end
end
