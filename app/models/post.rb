class Post < ActiveRecord::Base
  attr_accessible :description, :title, :user
  validates :title, presence: true, length: {:minimum => 5, :maximum => 255}
  validates :description, presence: true, length: {:minimum => 10}

  belongs_to :user
  has_many :comments
end
