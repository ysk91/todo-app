class TodosController < ApplicationController
  def create
    @category = Category.find(params[:category_id])
    @todo = @category.todos.build(todo_params)
    if @todo.save
      redirect_to categories_path
    else
      render 'categories'
    end
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
    params.require(:todo).permit(:content, :category_id)
  end
end
