class Api::V1::ApiBaseController < ActionController::Base
  protect_from_forgery
  
  private
  
  def authenticate_user_from_token!
    user_email = params[:email].presence
    user       = user_email && User.find_by_email(user_email)
 
    # use Devise.secure_compare to compare the token in the database with the 
    # token given in the params, mitigating timing attacks.
    if user && Devise.secure_compare(user.auth_token, params[:token])
      sign_in user, store: false
    end
  end

end