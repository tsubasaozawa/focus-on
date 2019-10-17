class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many   :likes
  has_many :liked_users, through: :likes, source: :user

  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
