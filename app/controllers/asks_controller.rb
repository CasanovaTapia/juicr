class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @asks = Ask.search(params[:query])
    else
      @asks = Ask.all
    end
    authorize @asks
  end

  def show
    authorize @ask
  end

  def new
    @ask = Ask.new
    @categories = Category.all
    authorize @ask
  end

  def edit
    authorize @ask
  end

  def create
    @ask = Ask.new(ask_params)
    @ask.user = current_user

    authorize @ask
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

    authorize @ask
    if @ask.update_attributes(ask_params)
      flash[:notice] = "Your Ask was successfully updated."
      redirect_to @ask
    else
      flash[:error] = "Your Ask was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    authorize @ask
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
