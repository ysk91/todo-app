class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :title,        null: false
      t.datetime :done_date,  null: true,   default: nil

      t.timestamps
    end
  end
end