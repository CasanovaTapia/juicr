class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]

  def index
    @asks = Ask.all
  end

  def show
  end

  def new
    @ask = Ask.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @ask = Ask.new(ask_params)
    @ask.user = current_user
    if @ask.save
      flash[:notice] = "Your Ask was successfully posted."
      redirect_to @ask
    else
      flash[:error] = "Your Ask was not posted. Please try again."
      render :new
    end
  end

  def update
    @ask.update(ask_params)

    if @ask.update_attributes(ask_params)
      flash[:notice] = "Your Ask was successfully updated."
      redirect_to @ask
    else
      flash[:error] = "Your Ask was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    if @ask.destroy
      flash[:notice] = "Your Ask was successfully deleted."
      redirect_to asks_path
    else
      flash[:error] = "Your Ask was not deleted. Please try again."
      render @ask
    end
  end

  private
    def set_ask
      @ask = Ask.find(params[:id])
    end

    def ask_params
      params.require(:ask).permit(:project_name, :project_description, :skills, :time_commitment, :location, :expectations, :user_id, :category_id)
    end
end
