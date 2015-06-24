class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :position
      t.boolean :complete
      t.references :category, index: true
      t.integer :parent_id

      t.timestamps null: false
    end
    add_foreign_key :tasks, :categories
  end
end
