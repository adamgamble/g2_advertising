class Proof < ActiveRecord::Base
  attr_accessible :user_id
  validates_presence_of :user_id

  belongs_to :user
  after_create :notify_user

  private
  def notify_user
    self.user.notify_of_proof_delivery
  end
end
