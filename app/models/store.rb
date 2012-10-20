class Store < ActiveRecord::Base
  attr_accessible :name, :organization_id, :message

  belongs_to :organization
  has_many :user_join_stores
  has_many :users, :through => :user_join_stores

  has_many :proof_join_stores
  has_many :proofs, :through => :proof_join_stores
end
