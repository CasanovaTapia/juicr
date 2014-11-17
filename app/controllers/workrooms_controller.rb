class WorkroomsController < ApplicationController
  def project
    @offer = Offer.find(params[:offer_id])
    @ask = @offer.ask
    authorize @offer
  end
end
