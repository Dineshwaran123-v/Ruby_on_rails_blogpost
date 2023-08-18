class Blogpost < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :category, presence: true
    has_many :comments, dependent: :destroy
    has_many :likes
    belongs_to :user
    has_many :liks

end
