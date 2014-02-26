class HomeController < ApplicationController

	before_filter :authenticate_user!
  
  def index
    @title = "MindBliss"
    @user = current_user

    gon.user = @user
    gon.brain = @user.brain
    gon.logged_in = true
  end

end
