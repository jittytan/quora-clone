get '/questions' do
	erb :"static.homepage"
end


post '/questions' do
 #if my helper has a current_user method that can return me who's the current log in user object
 # byebug
 @question = current_user.questions.new(question_description: params[:question])
 @question.save

 if @question.save
 	redirect '/users/' + current_user.id.to_s + '/questions/' + @question.id.to_s
 else
 end

end

get '/users/:user_id/questions' do
	erb :"static/question"
end


get '/users/:user_id/questions/:question_id' do
	erb :"static/question"
end


get '/questions/:question_id' do
	erb :"static/question"
end

get '/questions/:question_id/edit' do
	@edit = true
	erb :"static/question"
end

put '/questions/:question_id' do
	@edit_question = Question.find(params[:question_id])
	@edit_question.update(question_description: params[:edited_question])

	redirect '/questions/' + params[:question_id].to_s
end
