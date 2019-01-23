class CreateWeightClass < ActiveRecord::Migration[5.0]
  def change
    create_table :weight_classes do |t|
      t.integer :weight
      t.text :class_name
    end 
  end
end
