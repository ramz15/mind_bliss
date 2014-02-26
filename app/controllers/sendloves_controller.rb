class SendlovesController < ApplicationController

	before_filter :authenticate_user!

	def create
		@user = current_user
		sendlove_text = params[:body]
		sendlove_email = params[:email]

		# remove "my " from the string
		sendlove_name = params[:name]

		# save in gratitude table
		@sendlove = Sendlove.new(:user_id => @user.id,
                             :body => sendlove_text,
                             :email => sendlove_email,
                             :name => sendlove_name)

		success = @sendlove.save

		# update user Brain points
		if success
			@user.brain.add_points(100)
			@sendlove.send_email(@user.first_name, @user.last_name)
		end

    respond_to do |format|
      format.json {
        res = { :success => success }
        if success
          res[:sendlove_body] = params[:body]
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

  def sendlove_params
    params.require(:sendlove).permit(:user_id, :receiver_id, :body, :email, :name)
  end

end
