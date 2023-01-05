class ResetTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :categories
    drop_table :todos
  end
end
