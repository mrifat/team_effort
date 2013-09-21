class CreateEfforts < ActiveRecord::Migration
  def change
    create_table :efforts do |t|
      t.integer :user_id, null: false
      t.integer :created_by, null: false
      t.string :name, null: false

      t.foreign_key :users, column: 'created_by', dependent: :delete
      t.foreign_key :users, dependent: :delete

      t.timestamps
    end

    add_index :efforts, :user_id 
    add_index :efforts, :created_by 
  end
end
