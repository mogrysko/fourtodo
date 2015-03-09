class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :taskname
      t.boolean :completed
      t.date :duedate

      t.timestamps null: false
    end
  end
end
