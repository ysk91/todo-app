class CreateTodos < ActiveRecord::Migration[6.1]
  def up
    create_table :todos do |t|
      t.references  :category,  foreign_key: true
      t.string      :content,   null: false
      t.string      :status,    null: false,         default: :waiting
      t.date        :deadtime,  null: true
      t.date        :done_date, null: true,          default: nil

      t.timestamps
    end
  end
end
