class Api::V1::BrainsController < ActionController::Base
	protect_from_forgery

	def update
		puts params
		@user = User.find_by_authentication_token(params[:token])
		if @user.is_a? User
			@brain = @user.brain
      @brain.add_points(200)
      @user.next_action
      render :status=>200, :json=>@collections.as_json(:only => [:name, :id]) 
      # render json: @collections
    else
      render :status=>401, :json=>{:message=>"Invalid Authentication Token. Please Login again."}
    end
  end

end