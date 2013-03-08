class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:new, :create, :cancel]
  skip_before_filter :require_no_authentication

  def update
	  authorize! :assign_roles, @user if params[:user][:assign_roles]
	  super
  end
 
  def check_permissions
    authorize! :create, resource
  end
end