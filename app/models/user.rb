class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :logo
  # attr_accessible :title, :body

  has_many :notification_preferences
  has_many :proofs


  has_attached_file :logo,
    :styles => { :thumb => { :geometry => "200x200>",
      :format => :png
    } },
    :storage => :s3,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET'],
      :access_key_id     => ENV['amazon_s3_access_key'],
      :secret_access_key => ENV['amazon_s3_secret_key']
    }

  def notify_of_proof_delivery
    notify "New Proof Available"
  end

  def notify_of_resubmitted_proof_delivery
    notify "Proof Resubmitted for approval Available"
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
