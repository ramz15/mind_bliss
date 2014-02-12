class GratitudesController < ApplicationController

	# before_filter :authenticate_user!

	def create
		@user = current_user
		gratitude_text = params[:body]

		# save in gratitude table
		@gratitude = Gratitude.new(:user_id => @user.id,
                             	 :body => gratitude_text)

		success = @gratitude.save

		# update user Brain points
		if success
			@user.brain.add_points(100)
		end

    respond_to do |format|
      format.json {
        res = { :success => success }
        if success
          res[:gratitude] = params[:body]
          res[:points] = 100
        #   res[:html] = render_to_string({ :partial => '/gratitudes/gratitude_complete',
        #                         					# :locals  => { :comments => @comments },
        #                         					:formats => [:html],
        #                         					:layout  => false })
        end
        render :json => res.as_json
      }
      format.js
    end


	end

	private

  def gratitude_params
    params.require(:gratitude).permit(:user_id, :body)
  end
end
