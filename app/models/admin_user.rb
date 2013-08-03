class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  
  after_create { |admin| admin.send_reset_password_instructions }

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, :presence => true
  
  def password_required?
    new_record? ? false : super
  end

  def current_title
    self.email
  end

  private

  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :superuser

  def admin_user_params 
    params.require(:admin_user).permit(:email, :password, :password_confirmation, :remember_me, :superuser)
  end

end


#rails generate active_admin:resource vehicle_category
#rails generate active_admin:resource vehicle
#rails generate active_admin:resource vehicle_owner
#rails generate active_admin:resource driver

#The form below shows detailed info which will be from
#1>> owner of vehicle
#2>> Driver 1
#3>> Driver 2
#Details>> 
#a. Full Name
#b> house address
#c> State of origin
#D> Vehicle plate number
#e>> Vehicle registration number
#D>> driver license reg. no.
#e>>  Vehicle route number/ info ( yaba to Victoria island)
#f>> mobile and house phone number
