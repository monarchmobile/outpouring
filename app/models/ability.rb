class Ability
  include CanCan::Ability
  
  def initialize(user)
    can :read, :all 				  # allow everyone to read everything
    user ||= User.new 				  # guest user              
    if user.role? :Admin
      can :manage, :all
      can :publish, Article
      can :dashboard
      can :access, :rails_admin
      # can [:read, :edit], Frame
      can :manage, [
                    Role,
                    User]
      can :manage, Piggybak.config.manage_classes.map(&:constantize)
      Piggybak.config.extra_abilities.each do |extra_ability|
        can extra_ability[:abilities], extra_ability[:class_name].constantize
      end
    elsif user.role? :Moderator
      can :read, [Article, Comment]
      can [:edit, :update], Comment
    elsif user.role? :Member
       can :read, :all
       can :create, [Article, Comment]
       can [:edit, :update], Comment
    end
  end
end