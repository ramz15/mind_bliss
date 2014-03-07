class DreamsController < ApplicationController

	before_filter :authenticate_user!

	def create
		puts params
		@user = current_user
		dream_title = params[:dream_title]
		minutes_per_week = params[:minutes_per_week].to_i*60

		# save in gratitude table
		@dream = Dream.new(:user_id => @user.id,
                       :title => dream_title,
                       :minutes_per_week => minutes_per_week)

		success = @dream.save

		# update user Brain points
		if success
			@user.brain.add_points(100)
		end

    respond_to do |format|
      format.json {
        res = { :success => success }
        render :json => res.as_json
      }
      format.js
    end


	end

	private

  def gratitude_params
    params.require(:dream).permit(:user_id, :title, :minutes, :category, :minutes_per_week, :minutes_this_week)
  end

end
