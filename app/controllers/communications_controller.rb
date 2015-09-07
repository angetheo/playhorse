class CommunicationsController < ApplicationController

	def edit
		respond_to do |format|
	    format.json {
				@communication = Communication.where(comm_type: params[:t]).first
	    	@communication.content = params[:edit_communication]
	    	@communication.save!
	    	render json: @communication 
	    }
		end
	end

end
