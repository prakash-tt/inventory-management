class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :manage, Post
    can [:read, :create], Comment
    cannot [:update, :destroy], Post do |post|
      post.user_id != user.id
    end
    can [:destroy], Comment do |comment|
      comment.user_id == user.id
    end
  end
end
