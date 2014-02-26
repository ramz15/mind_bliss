class Inbound::InboundEmailsController < ApplicationController

	protect_from_forgery with: :null_session

	def sendlove
		puts params
		render :status=>200
	end

end
