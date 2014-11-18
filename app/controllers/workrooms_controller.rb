class WorkroomsController < ApplicationController
  before_action :authenticate_user!
  
  def project
    @offer = Offer.find(params[:offer_id])
    @ask = @offer.ask
    authorize @offer
  end
end
