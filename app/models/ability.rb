class Ability
  include CanCan::Ability
  
  def initialize(user)
    # can :read, :all 				  # allow everyone to read everything
    user ||= User.new 				  # guest user              
    if user && user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      if user.role? :superadmin
        can :manage, :all             # allow superadmins to do anything
        can :manage, Piggybak.config.manage_classes.map(&:constantize)
        Piggybak.config.extra_abilities.each do |extra_ability|
          can extra_ability[:abilities], extra_ability[:class_name].constantize
        end
      elsif user.role? :manager
        can :manage, [User, Product]  # allow managers to do anything to products and users
      elsif user.role? :sales
        can :update, Product, :hidden => false  # allow sales to only update visible products
      end
    end
  end
end