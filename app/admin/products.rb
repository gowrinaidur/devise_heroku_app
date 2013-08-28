ActiveAdmin.register Product do
  index do 
  	column :name
  	column "Avatar" do |x| #:avatar_file_name
  		image_tag(x.avatar.url(:thumb),:size=>"100x100").html_safe
	end
  	column :color
  	column :price
  	column :discount
  	default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
  	f.inputs "Details" do
  		f.input :name
  		f.input :price
  		f.input :color
  		f.input :discount
  	end
  	f.inputs "Avatar" do 
  		f.input :avatar, :as => :file   #, :hint => image_tag(f)
  	end
  	f.actions

  end

  controller do
      # This code is evaluated within the controller class

      def create
      	#render :text => params and return false
      	@product = Product.new(params[:product])
      	if @product.save
      		flash[:notice] = "Product has been successfully created"
      		redirect_to admin_products_path
      	else
      		flash[:notice] = "Enter blanked fields"
      		render "new"
      	end

        # Instance method
      end
  end

end
