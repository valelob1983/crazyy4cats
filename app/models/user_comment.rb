class UserComment < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :publication
  end