class GratitudesController < ApplicationController

	private

  def gratitude_params
    params.require(:gratitude).permit(:user_id, :body)
  end
end
