class Proof < ActiveRecord::Base
  attr_accessible :user_id, :proof_pdf
  validates_presence_of :user_id

  belongs_to :user
  after_create :notify_user

  image_accessor :proof_pdf

  private
  def notify_user
    self.user.notify_of_proof_delivery
  end
end
