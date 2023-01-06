class TodosController < ApplicationController
  # def create
  #   @todo = Category.todos.build(todo_params)
  # end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.now
      @todo.update_column(:done_date, now)
    end
    redirect_to categories_url, notice: "ToDo「#{@todo.content}」を完了しました。"
  end
end
