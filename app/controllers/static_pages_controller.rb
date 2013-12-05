class StaticPagesController < ApplicationController

	before_filter :if_logged_in

  def home
  	@title = "MindBliss"
  end

  def about
  	@title = "MindBliss | About"
  end

  protected

  def if_logged_in
    if user_signed_in? then redirect_to '/home' end
  end

end

