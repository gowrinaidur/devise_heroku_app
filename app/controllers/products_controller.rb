class ProductsController < ApplicationController
	def index
		@products = Product.all
		render :text => @products.inspect and return false
	end

	def new 
		@product = Product.new		
	end

	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to root_path
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
		session[:products] ||= Array.new
		session[:products] << params[:id] unless !params[:id].present?

		if session[:products].present?
			@products = Product.find(session[:products]) 
		else
			flash[:notice] = "You have no cars in the cart to purchage"
			redirect_to root_path
		end
	end

	def delete_session_products
		session[:products] = session[:products] - params[:product_ids].split(',')
		flash[:notice] = "Successfully deleted from the track"
		redirect_to add_to_cart_path 
	end
end
