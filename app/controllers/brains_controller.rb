class BrainsController < ApplicationController

	before_filter :authenticate_user!

  private

  def brain_params
    params.require(:brain).permit(:user_id, :points)
  end

end
