class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  validates :name, presence: true, length: {:minimum => 2, :maximum => 50}

  has_many :posts, :dependent => :delete_all
  has_many :comments, :dependent => :delete_all

  before_save {email.downcase!}
  after_save :send_welcome_email

  def send_welcome_email
    if self.confirmed_at_changed?
      UserMailer.welcome_email(self).deliver!
    end
  end

end
