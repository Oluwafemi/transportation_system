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

#rails generate active_admin:resource vehicle_driver


