class Comment < ActiveRecord::Base
  attr_accessible :body, :post, :user

  validates :body, :presence => true, :length => {minimum: 5}

  belongs_to :user
  belongs_to :post
end
