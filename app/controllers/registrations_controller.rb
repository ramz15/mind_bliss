class RegistrationsController < Devise::RegistrationsController
    
  before_filter :authenticate_user!, :except => [:create, :new]
  
  def new
    @title = "LoveALLogy Signup"
  end

  def create
    user = params[resource_name]
    
    @user = User.new(user)

    if @user.save
      # send welcome email to new user
      # UserMailer.welcome_email(@user, false).deliver
      # @user.delay.subscribe_mailing_list()
      # sign_in_and_redirect @user

      sign_in @user
      redirect_to logged_in_home_path
      
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to root_path and return
    end
  end

  def update
    @user = current_user
    user_info = params[:user]
    new_user_data = @user.update_attributes(:email => user_info[:email],
                                            :first_name => user_info[:first_name],
                                            :last_name => user_info[:last_name],
                                            :name => user_info[:first_name] + " " + user_info[:last_name],
                                            :username => user_info[:username].downcase)
    if new_user_data
      flash[:success] = "Successfully updated account"
      redirect_to "/settings"
    else
      flash[:error] = @user.errors.full_messages.to_sentence
      redirect_to "/settings"
    end
      
  end


end
