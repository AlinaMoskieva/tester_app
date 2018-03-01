class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :test, null: false, index: true
      t.string :question, null: false
      t.string :answer, null: false
      t.string :user_answer
      t.string :content_type, null: false
      t.integer :index, null: false
      t.boolean :truthy, default: false, null: false

      t.timestamps
    end
  end
end
