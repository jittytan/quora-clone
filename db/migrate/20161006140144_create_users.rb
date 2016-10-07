class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :user_name
			t.string :email
			t.string :password
			t.string :password_digest
			t.timestamp null: false
		end
	end
end


# User.new(username: "jittytan" , email: "joe@example.com", password:"tjs123456'