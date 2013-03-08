class Ability
  include CanCan::Ability
  
  def initialize(user)
    can :read, :all           # allow everyone to read everything
    user ||= User.new                     
    if user.role? :Admin      ### ADMIN ###
      can :manage, :all
      can :assign_roles, User
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
    elsif user.role? :Moderator   ### MODERATOR ###
      can :read, [Article, Comment]
      can :publish, Article
      can [:create, :edit, :update], [Comment, Article]
    elsif user.role? :Guest       ### GUEST ###
       can :read, :all
       can :create, Comment   
       # can [:edit, :update], 
     end
  end
end