class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable

 ROLES = {"1"=>"Admin","2"=>"Dealer","3"=>"Customer"}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role,:provider,:uid
  has_many :categories
  # attr_accessible :title, :body

  	
  	def self.find_for_omniauth_oauth(auth, signed_in_resource=nil)
	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	    user = User.create(name:auth.extra.raw_info.name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20],
	                         role: 3
	                         )
	  end
	  user
	end

	def self.find_for_linkedin_omniauth_oauth(auth, signed_in_resource=nil)
	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	    user = User.create(name:auth.info.name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20],
	                         role: 3
	                         )
	  end
	  user
	end
end
