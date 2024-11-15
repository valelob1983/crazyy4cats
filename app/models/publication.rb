class Publication < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :user_comments, dependent: :destroy
end

