

get '/homepage' do 
	erb :"static/homepage"
end

get '/logout' do

	# byebug

	session[:user_id] = nil
	erb :"static/index"
end


# in users_controller.rb
post '/signup' do
  user = User.new(user_name: params[:new_user][:user_name], email: params[:new_user][:email], password: params[:new_user][:password])
  user.save
  if user.save
  	session[:user_id] = user.id
    redirect "/homepage" # what should happen if the user is save?
  else
  	@flash_msg = user.errors.full_messages
		# return @flash_msg
		erb :"static/index"
    # what should happen if the user keyed in invalid data?
  end
end  


post '/login' do

	@user = User.find_by(email: params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		# .try(:authenticate, params[:user][:password])
		# In fact, the act of "logging in", is simply the the act of having your user id stored inside the session hash. 
		# The act of "logging out" is simply the act of your user id being removed from the session hash. 
		# The session hash is most commonly used to store info like a user's id, 
		# which the web application will use to know who is the "current user" and show that user the appropriate information 
		session[:user_id] = @user.id
		redirect "/homepage"
	

	else 
		@msg = "Invalid information"
		erb :"static/index"
	end
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
  
end


get '/users/:user_id' do
	if logged_in?
		erb :"static/profile"
	else
		erb :"static/index"
	end
end





post '/logout' do

	session[:user_id] = nil
	redirect "/"

  # kill a session when a user choses to logout, for example assign nil to a session
  # redirect to the appropriate page
end


get '/users/:user_id/questions' do
	byebug
	erb :"static/question"



end

