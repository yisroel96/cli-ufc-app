class CreatePasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :passwords do |t|
      t.text :password_entry
      t.integer :user_id
    end 
  end
end
