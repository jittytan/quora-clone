get '/' do
  if logged_in?
		erb :"static/homepage"
	else
		erb :"static/index"
	end
end