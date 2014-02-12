class Brain < ActiveRecord::Base  
  belongs_to :user

  def add_points(number)
  	# add points to user's brain
  	self.increment!(:points, by = number)

  	# increment user to the next action
  	self.increment!(:action_count)
  end

end
