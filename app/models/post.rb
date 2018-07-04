class Post < ActiveRecord::Base
  attr_accessible :description, :title, :user
  validates :title, presence: true, length: {:minimum => 5, :maximum => 255}, uniqueness: true
  validates :description, presence: true, length: {:minimum => 10}

  belongs_to :user
  has_many :comments, :dependent => :delete_all

  after_create :send_email_to_user

  def send_email_to_user
    UserMailer.delay.post_creation_email(self.id)
  end
end
