class BrainsController < ApplicationController

	before_filter :authenticate_user!

	def index
		puts params
	end

	def update
		puts params
	end	

  private

  def brain_params
    params.require(:brain).permit(:user_id, :points, :action_count, :sendloves_count)
  end

end
