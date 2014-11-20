class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    authorize @categories
  end

  def show
    @category = Category.find(params[:id])
    authorize @category
  end

  def users
    @category = Category.find(params[:category_id])
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    @category.save
    redirect_to asks_path
  end

  def destroy
    authorize @category
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
