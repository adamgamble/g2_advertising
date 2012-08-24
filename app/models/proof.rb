class Proof < ActiveRecord::Base
  attr_accessible :user_id, :pdf, :pdf_file_name
  validates_presence_of :user_id

  belongs_to :user
  after_create :notify_user

  has_attached_file :pdf,
    :styles => { :thumb => { :geometry => "200x200>",
      :format => :jpg
    } },
    :storage => :s3,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET'],
      :access_key_id     => ENV['amazon_s3_access_key'],
      :secret_access_key => ENV['amazon_s3_secret_key']
    }

  private
  def notify_user
    self.user.notify_of_proof_delivery
  end
end
