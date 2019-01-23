class CreateFighter < ActiveRecord::Migration[5.0]
  def change
    create_table :fighters do |t|
      t.text :name
      t.text :nickname
      t.text :city
      t.text :country
      t.integer :height
      t.integer :camp_id
      t.integer :weight_class_id
    end 
  end
end
