class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.includes(:todos).active.order(id: :DESC).page(params[:page]).per(10)
    @category = Category.new
    # ToDoの新規作成と追加作成を分けて定義する
    5.times { @category.todos.build }
    @add_todo = @category.todos.build
    select_statuses

    @all_category_count = Category.all.count
    @active_category_count = Category.active.count
  end

  def create
    @category = Category.create(category_params)
    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
    @todos = @category.todos
    select_statuses
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    ActiveRecord::Base.transaction do
      now = Time.now
      @category.update_column(:done_date, now)
    end
    redirect_to categories_url, notice: "カテゴリー「#{@category.title}」を完了しました。"
  end


  private
    def category_params
      params.require(:category).permit(:title, todos_attributes: [:id, :category_id, :content, :status, :_destroy])
    end

    def select_statuses
      @statuses = Todo.status.options << ['選択してください', '']
    end
end
