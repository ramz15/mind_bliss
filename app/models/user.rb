class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one  :brain
  has_many :gratitudes
  after_create :create_user_brain

  def create_user_brain
    # A Brain is created every time a user is created.
    Brain.create(:user_id => self.id)
  end

end
