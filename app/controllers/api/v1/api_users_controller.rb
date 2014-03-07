class Api::V1::ApiUsersController < Api::V1::ApiBaseController
	respond_to :json

	def create  
		puts params      
    if params[:email].nil? or params[:pw].nil?
       render :status=>400,
              :json=>{:message=>"The request must contain the user email and password."}
       return
    end
    
    @user = User.new(:first_name => params[:first_name],
                     :email => params[:email],
                     :password => params[:pw])
  
    if @user.save
      @user.ensure_auth_token

      sign_in @user
      
      # send welcome email to new user
      # UserMailer.delay.welcome_email(@user, false)
            # @user.delay.subscribe_mailing_list()
      # unless params[:from_chrome_app] == "true"
      #   @mixpanel.track_event("New User", {:type => "Marqueed", :from => "Mac App", :distinct_id => @user.username})
      # else
      #   @mixpanel.track_event("New User", {:type => "Marqueed", :from => "Chrome App", :distinct_id => @user.username})
      # end
      
      render :status=>200, :json=>{:id=>@user.id, :auth_token=> @user.auth_token}

    else
      # respond with errors
      error = @user.errors.full_messages.to_sentence
      render :status=>401, :json=>{:message=>error}
      
    end
  end

end
