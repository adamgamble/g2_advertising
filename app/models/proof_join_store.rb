class ProofJoinStore < ActiveRecord::Base
  attr_accessible :proof_id, :store_id
  belongs_to :proof
  belongs_to :store
end
