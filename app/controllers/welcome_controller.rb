class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
 	@products = Product.all
  end
end
