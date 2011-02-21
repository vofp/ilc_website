require 'digest/sha1'
class User < ActiveRecord::Base
	attr_accessor :password
	
	has_many :blogs, :order => "created_at DESC"
	has_and_belongs_to_many :projects
	has_many :activities, :through => :projects, :source => :events

	validates :name, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true
	validates :password, :presence => true, :confirmation => true

	before_save :encrypt_new_password

	def self.authenticate(login,pwd)
		user = find_by_name(login)
		return user if user && user.authenticated?(pwd)
	end
	
	def authenticated?(pwd)
		hashed_password == encrypt(pwd)
	end

	protected
		def encrypt_new_password
			return if password.blank?
			self.hashed_password = encrypt(password)
		end
		
		def encrypt(string)
			Digest::SHA1.hexdigest(string)
		end

end
