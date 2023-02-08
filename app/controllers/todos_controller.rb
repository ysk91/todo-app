class TodosController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @todo = @category.todos.create(todo_params)
    redirect_to categories_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    ActiveRecord::Base.transaction do
      now = Time.now
      @todo.update_column(:done_date, now)
    end
    redirect_to categories_url, notice: "ToDo「#{@todo.content}」を完了しました。"
  end

  private

  def todo_params
    params.require(:todo).permit(:category_id, :content, :status)
  end
end
