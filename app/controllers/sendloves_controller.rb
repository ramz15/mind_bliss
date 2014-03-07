class SendlovesController < ApplicationController

	before_filter :authenticate_user!, :except => [:reply]

	def create
		@user = current_user
		sendlove_text = params[:body]
		sendlove_email = params[:email]
    send_to_id = params[:send_to_id]

		# remove "my " from the string
		sendlove_name = params[:name]

    if sendlove_email.blank?
      sendlove_email = User.find_by_id(send_to_id).email
    end

		# save in gratitude table
		@sendlove = Sendlove.new(:user_id => @user.id,
                             :receiver_id => send_to_id,
                             :body => sendlove_text,
                             :email => sendlove_email,
                             :name => sendlove_name)

		success = @sendlove.save

		# update user Brain points
		if success
			@user.brain.add_points(100)
			@sendlove.send_email(@user.first_name, @user.last_name, @user.id)
		end

    respond_to do |format|
      format.json {
        res = { :success => success }
        render :json => res.as_json
      }
      format.js
    end
	end

  # sendlove replies here, linked from the sendlove email
  def reply
    @title = "MindBliss | Send Love Reply"
    gon.not_logged_in = user_signed_in? ? false : true
    gon.brain = {"points" => 0}
    # 
    gon.logged_in = true
  end

	private

  def sendlove_params
    params.require(:sendlove).permit(:user_id, :receiver_id, :body, :email, :name)
  end

end
