class Proof < ActiveRecord::Base
  attr_accessible :pdf, :pdf_file_name, :in_home_date, :print_date, :approval, :urgent_message, :proof_changes, :proof_deadline
  attr_accessor :approval

  has_many :proof_join_stores
  has_many :stores, :through => :proof_join_stores
  #after_create :notify_user

  has_attached_file :pdf, ::PDF_SETTINGS_HASH

  state_machine :state, :initial => :sent_to_client do
    #after_transition :on => :ready_for_print, :do => :notify_matt_of_ready_for_print
    #after_transition :on => :resubmitted_proof_with_changes, :do => :notify_user_of_resubmit
    event :ready_for_print do
      transition [:sent_to_client] => :ready_for_print
    end
    event :approved_pending_changes do
      transition [:sent_to_client] => :ready_for_print
    end
    event :resubmit_with_changes do
      transition [:sent_to_client] => :resubmit_with_changes
    end
    event :resubmited_proof_with_changes do
      transition [:resubmit_with_changes] => :sent_to_client
    end
  end

  private
=begin
  def notify_matt_of_ready_for_print
    UserMailer.notify_matt("Redy for print!").deliver
  end

  def notify_user
    self.user.notify_of_proof_delivery
  end

  def notify_user_of_resubmit
    self.user.notify_of_resubmitted_proof_delivery
  end
=end
end
