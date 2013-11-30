class SessionsController < Devise::SessionsController

  def new
    @title = "MindBliss Login"
  end  

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => 'sessions#failure')
    # @mixpanel.track_event("Login ", {:type => "Marqueed" })
    return sign_in_and_redirect(resource_name, resource)
  end

  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource

    redirect_to logged_in_home_path

    #return render :json => {:success => true, :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)}
  end

  def failure
    @title = "Login"
    @user = User.new(params[:user])
    flash[:error] = "Incorrect email or password. Please try again."
    redirect_to root_path and return
  end

end
