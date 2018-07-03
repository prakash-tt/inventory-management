class UserMailer < ActionMailer::Base
  default from: "prakash.mishra@traveltriangle.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Blog')
  end

  def post_creation_email(post)
    @post = post
    mail(to: post.user.email, subject: 'You added a new blog - ' + @post.title)
  end

end
