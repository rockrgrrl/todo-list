class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :description
      t.boolean :completed, default: false
      t.references :list, index: true

      t.timestamps null: false
    end
    add_foreign_key :tasks, :lists
  end
end
