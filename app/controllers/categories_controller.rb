class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def users
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to asks_path
  end

  def destroy
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
