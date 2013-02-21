class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :role, :admin
  # attr_accessible :title, :body

  ROLES = %w[superadmin manager]

  def role?(role)
    ROLES.include?(role.to_s)
  end

  def fullname
  	[first_name, last_name].join(" ")
  end

  def fullname=(name)
  	split = name.split(" ")
  	first_name = split[0]
  	last_name = split[1]
  end
end
