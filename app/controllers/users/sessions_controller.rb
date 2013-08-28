class Users::SessionsController < Devise::SessionsController

	def new
		super
	end

	def create
		if current_user
			redirect_to root_path
		else
			redirect_to new_user_registration_url
		end
	end

end
