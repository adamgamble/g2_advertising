class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :notification_preferences
  has_many :proofs

  def notify_of_proof_delivery
    notify "New Proof Available"
  end

  def notify message
    self.notification_preferences.each do |notification_preference|
      notification_preference.notify! message
    end
  end

  def to_s
    email
  end
end
