class UserComment < ApplicationRecord
  belongs_to :publication
  belongs_to :user, optional: true
  has_many :reactions, dependent: :destroy
 
end