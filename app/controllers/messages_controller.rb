class MessagesController < ApplicationController
	def create
		@offer = Offer.find(params[:offer_id])
		@message = @offer.messages.new(message_params)
		@message.user = current_user

		if @message.save
	      	flash[:notice] = "Your message was successfully posted."
	      	redirect_to ask_offer_workrooms_project_path(@offer.ask, @offer)
	    else
	      	flash[:error] = "Your message was not posted. Please try again."
			redirect_to ask_offer_workrooms_project_path(@offer.ask, @offer)
	    end
	end

	def update
		@message = Message.find(params[:id])

		if @message.update_attributes(message_params)
	    	flash[:notice] = "Message was updated."
			redirect_to ask_offer_workrooms_project_path(@offer.ask, @offer)
	    else
	    	flash[:error] = "Message was not updated. Please try again."
			redirect_to ask_offer_workrooms_project_path(@offer.ask, @offer)
	    end
	end

	def destroy
		@message = Message.find(params[:id])
		@message.destroy
		redirect_to ask_offer_workrooms_project_path(@offer.ask, @offer)
	end

	private

	def message_params
		params.require(:message).permit(:body)
	end
end
