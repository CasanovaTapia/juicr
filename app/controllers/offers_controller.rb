class OffersController < ApplicationController
  def create
    @ask = Ask.find(params[:ask_id])
    @offer = @ask.offers.new(offer_params)
    @offer.user_id = current_user.id

    if @offer.save
      flash[:notice] = "Your Give was successfully posted."
      redirect_to @ask
    else
      flash[:error] = "Your Give was not posted. Please try again."
      redirect_to asks_path
    end
  end

  def destroy
    @offer = Offer.find(params[:id])

    if @offer.destroy
      flash[:notice] = "Your Give was successfully deleted."
      redirect_to @ask
    else
      flash[:error] = "Your Give was not deleted. Please try again."
      redirect_to @ask
    end
  end

  def update
    @offer = Offer.find(params[:id])
    @ask = @offer.ask

    authorize @offer
    if @offer.update_attributes(:accepted => true)
      flash[:notice] = "Offer was accepted!"
      redirect_to @ask
    else
      flash[:error] = "Offer was not accepted. Please try again."
      redirect_to @ask
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:body)
  end
end
