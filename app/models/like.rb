class Like < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :post
  
  validates_uniqueness_of :post_id, scope: :user_id
end
