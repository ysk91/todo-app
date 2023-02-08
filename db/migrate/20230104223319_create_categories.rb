class CreateCategories < ActiveRecord::Migration[6.1]
  def up
    create_table :categories do |t|
      t.string :title,      null: false
      t.date   :done_date,  null: true,   default: nil

      t.timestamps
    end
  end
end
