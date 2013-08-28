class Users::SessionsController < Devise::SessionsController

	def new
		super
	end

	def create
		if current_user
			flash[:notice] = "Login Success!!!!!!!!!"
			redirect_to root_path
		else
			flash[:notice] = "Please check your credentials OR Signup here"
			redirect_to new_user_registration_url
		end
	end

end
