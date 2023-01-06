class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string     :content,   null: false
      t.datetime   :deadtime,  null: true
      t.datetime   :done_date, null: true,   default: nil
      t.references :category,  foreign_key: true

      t.timestamps
    end
  end
end
