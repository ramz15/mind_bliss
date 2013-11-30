class HomeController < ApplicationController

	before_filter :authenticate_user!
  
  def index
    @title = "MindBliss"
    @user = current_user
  end

end
