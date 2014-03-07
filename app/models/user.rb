class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one  :brain
  has_many :gratitudes
  has_many :sendloves
  has_many :received_loves, foreign_key: "receiver_id", class_name: "Sendlove"
  has_many :dreams
  after_create :create_user_brain

  def create_user_brain
    # A Brain is created every time a user is created.
    Brain.create(:user_id => self.id)
  end

  # Devise token authentication methods
  def ensure_auth_token
    if auth_token.blank?
      self.auth_token = generate_auth_token
    end
  end
 
  private
  
  def generate_auth_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(auth_token: token).first
    end
  end

end
