class TodosController < ApplicationController
  def destroy
    @todo = Todo.find(params[:id])
    ActiveRecord::Base.transaction do
      now = Time.now
      @todo.update_column(:done_date, now)
    end
    redirect_to categories_url, notice: "ToDo「#{@todo.content}」を完了しました。"
  end
end
