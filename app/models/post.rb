class Post < ApplicationRecord
  
  belongs_to :user
  has_many :post_images
  attachment :image
  validates :body, presence: true, length: { maximum: 140 }
  
end
