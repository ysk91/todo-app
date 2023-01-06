class CategoriesController < ApplicationController
  def index
    @categories = Category.active.order(id: :DESC)
    @category = Category.new
    @todo = @category.todos.build
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      # @todos = []

      # CreateTodoListJob.perform_now(@todos)
      redirect_to categories_path
    else
      render 'categories'
    end

  end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.now
      @category.update_column(:done_date, now)
    end
    redirect_to categories_url, notice: "カテゴリー「#{@category.title}」を完了しました。"
  end


  private
    def category_params
      params.require(:category).permit(:title, todos_attributes: [:id, :content])
    end
end
