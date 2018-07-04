class UserMailer < ActionMailer::Base
  include ApplicationHelper
  default from: "prakash.mishra@traveltriangle.com"

  def welcome_email(user_id)
    @user = User.find_by_id(user_id)
    if @user.nil?
      mailer_logger.error "User with id - #{user_id} doesn't exist"
    else
      mail(to: @user.email, subject: "Welcome to My Blog")
    end
  end

  def post_creation_email(post_id)
    @post = Post.find_by_id(post_id)
    if @post.nil?
      mailer_logger.error "Post with id - #{post_id} doesn't exist"
    else
      mailer_logger.info "Sending email to - #{@post.user.email}"
      mail(to: @post.user.email, subject: "You added a new post - #{@post.title}}")
    end
  end

end
