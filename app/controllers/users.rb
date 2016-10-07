get '/' do 
	erb :"static/index"

end

get '/homepage' do 
	erb :"static/homepage"
end

get '/logout' do

	byebug

	session[:user_id] = nil
	erb :"static/index"
end


# in users_controller.rb
post '/signup' do
  user = User.new(user_name: params[:user][:user_name], email: params[:user][:email], password: params[:user][:password])
  user.save
  if user.save
    redirect "/homepage" # what should happen if the user is save?
  else
  	@flash_msg = {info: "Not successful"}
		return @flash_msg
		erb :"static/homepage"
    # what should happen if the user keyed in invalid data?
  end
end  


post '/login' do

	if User.find_by(email: params[:user][:email]).try(:authenticate, params[:user][:password])
		# In fact, the act of "logging in", is simply the the act of having your user id stored inside the session hash. 
		# The act of "logging out" is simply the act of your user id being removed from the session hash. 
		# The session hash is most commonly used to store info like a user's id, 
		# which the web application will use to know who is the "current user" and show that user the appropriate information 
		session[:user_id] = User.find_by(email: params[:user][:email])[:id]
		redirect "/homepage"

	end
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  
end

post '/logout' do

	session[:user_id] = nil
	redirect "/"

  # kill a session when a user choses to logout, for example assign nil to a session
  # redirect to the appropriate page
end

