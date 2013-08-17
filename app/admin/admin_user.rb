ActiveAdmin.register AdminUser do
  
  actions :all, :except => [:destroy]
  
  show :title => :current_title do
    attributes_table do
      row :email
      row :sign_in_count
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
      row :superuser
    end
    active_admin_comments
  end

  controller do
    
    def permitted_params
      params.permit admin_user: [:email, :password, :password_confirmation]
    end

    def action_methods
      if current_admin_user.superuser
        super
      end
    end

    def create
      admin = AdminUser.create(:email => params[:admin_user][:email], :superuser => params[:admin_user][:superuser])
      if admin.valid?
        redirect_to :action => :index
      else
        redirect_to :action => :new
      end
    end
    
    def update
      admin = AdminUser.find(params[:id])
      admin.email = params[:admin_user][:email]
      
      if admin.id != current_admin_user.id
        admin.superuser = params[:admin_user][:superuser]
      end
            
      if admin.save        
        redirect_to :action => :index
      else
        admin.valid?
        redirect_to :action => :edit
      end

    end

    def destroy
      super
    end
  
  end
  
  menu :if => proc{ current_admin_user.superuser }

  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    column :superuser
    column do |user|
      if user.encrypted_password == ''
        delete = link_to("Details", admin_admin_user_path(user)) + delete.try(:html_safe)
      else
        delete = " | " + link_to("Delete", admin_admin_user_path(user), :method => :delete, :confirm => "Are you sure?") unless current_admin_user == user
      
        link_to("Details", admin_admin_user_path(user)) + " | " + \
        link_to("Edit", edit_admin_admin_user_path(user)) + delete.try(:html_safe)
      end
    end
  end
  
  filter :email
  filter :superuser
  filter :current_sign_in_at
  filter :last_sign_in_at
  filter :sign_in_count

  form do |f|
    if f.object.persisted? and current_admin_user.id == f.object.id
      f.inputs do  
        f.input :email
      end
    else
      f.inputs do 
        f.input :email 
        f.input :superuser, :label => "Super User Priveleges" 
      end
    end
    f.buttons
  end

end