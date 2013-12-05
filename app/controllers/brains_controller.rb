class BrainsController < ApplicationController

  private

  def brain_params
    params.require(:brain).permit(:user_id, :brain_cells)
  end

end
