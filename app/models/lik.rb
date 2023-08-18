class Lik < ApplicationRecord
  validates :user_id, uniqueness: {scope: :blogpost_id}
  belongs_to :user
  belongs_to :blogpost
end
