class Post < ApplicationRecord
  belongs_to :user
  has_many :comment_posts
  has_many :comments, through: :comment_posts
end