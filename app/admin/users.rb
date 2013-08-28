ActiveAdmin.register User do
  index do 
  	column :name
  	column :email
  	column :role do |r|
  		User::ROLES[r.role.to_s]
  	end
  	default_actions
  end

  	form do |f|
      f.inputs "Details" do
        f.input :name
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.inputs "Role" do
        f.input :role, :as=>:select,:collection=>User::ROLES.map{|k,v| [v,k]}, :prompt => "Select Role"
      end
      f.actions
	end

	filter :name
	filter :email
    filter :role, :as => :check_boxes, :collection => proc { User::ROLES.map{|k,v| [v,k]} }

end
