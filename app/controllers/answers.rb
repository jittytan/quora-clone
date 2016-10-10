# get '/question/:id/answer/new' do 
	
# 	erb :"static/homepage"

# end

post '/questions/:question_id/answers' do 

	@answer = current_user.answers.new(answer_description: params[:answer], question_id: params[:question_id])
	
	@answer.save

	if @answer.save
 	redirect '/questions/' + params[:question_id].to_s
 else
 end

end

get '/users/:user_id/answers' do
	@user_answer = true # To make sure that the only the user answer is shown and not other user answers too.

	erb :"static/question"
end

get '/answers/:answer_id/edit' do
	erb :"static/question"
end

put '/answers/:answer_id' do
	@edit_answer = Answer.find(params[:answer_id])
	@edit_answer.update(answer_description: params[:edited_answer])

	redirect '/answers/' + params[:answer_id].to_s
end


get '/answers/:answer_id' do
	erb :"static/question"
end