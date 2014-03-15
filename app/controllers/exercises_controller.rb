class ExercisesController < ApplicationController

	before_filter :authenticate_user!

	def create
		puts params
		@user = current_user
		minutes = params[:minutes]

		# save in gratitude table
		@exercise = Exercise.new(:user_id => @user.id,
														 :minutes => minutes)
		success = @exercise.save

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
    params.require(:dream).permit(:user_id, :minutes)
  end

end
