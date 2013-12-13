class Brain < ActiveRecord::Base  
  belongs_to :user

  def add_points(number)
  	self.increment!(:points, by = number)
  end
end
