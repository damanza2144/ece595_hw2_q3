require 'digest/sha2'
#require 'digest'

class User < ActiveRecord::Base
	
	validates :name, :presence => true, :uniqueness => true
	validates :password, :confirmation => true
	
	attr_accessor :password_confirmation
	attr_reader :password
	
	validate :password_must_be_present
	
	has_many :posts
	has_many :comments
	
	def User.authenticate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end
	
	def User.encrypt_password(password, salt)
		Digest::SHA256.hexdigest(password + salt)
	end

	def password=(password)
		@password = password
		
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end
	
	private
	
	def password_must_be_present
		errors.add(:password, "Missing password") unless hashed_password.present?
	end
	
	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

end
