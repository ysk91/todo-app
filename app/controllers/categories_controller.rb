class CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = Category.active
  end

  def create
    @category = Category.create(category_params)
  end

  def destroy
    ActiveRecord::Base.transaction do
      now = Time.now
      @category.update_column(:done_date, now)
    end
    redirect_to categories_url, notice: "カテゴリー「#{@category.title}」を削除しました。"
  end


  private
    def category_params
      params.require(:category).permit(:title)
    end
end
