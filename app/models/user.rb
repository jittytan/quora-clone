class User < ActiveRecord::Base

	# This is Sinatra! Remember to create a migration!
	validates :user_name, uniqueness: true
	validates :email, uniqueness: true, :format => {:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "The email has been used/Not a valid email address"}
	# \A = start of string
	# [^@\s] = Any single character except: @ and any whitespace character
	# \. = must include .
	# \z = end of string
	validates :password, :format => {:with => /\A(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$\z/, message: "Must be at least 6 characters and include one number and one letter."} 
	# ^ = look ahead for
	# (?=.*[a-zA-Z]) = an arbitrary string followed by a letter
	# (?=.*[0-9]) = arbitrary string followed by a number
	# .{6,}$ Ensure there are at least 6 characters
	has_secure_password
	# e.g., User.authenticate('coding@gmail.com', 'codingrocks88')
  # def self.authenticate(email, password)
  #   # if email and password correspond to a valid user, return that user
  #   # otherwise, return nil
  # end
  has_many :question

end



