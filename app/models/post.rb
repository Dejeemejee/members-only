class Post < ApplicationRecord
  belongs_to :user
  validates_associated :users
  validates :title, presence: true
  validates :contnet, presence: true
end
