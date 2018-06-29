class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  before_save {email.downcase!}

  validates :name, presence: true, length: {:minimum => 2, :maximum => 50}
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
            uniqueness: {case_sensitive: false}

  has_secure_password
end
