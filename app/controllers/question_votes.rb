post '/questions/:question_id/up_vote' do
# post '/questions/:question_id/up_vote'
	@vote = current_user.question_votes.find_by(user_id: current_user.id, vote_type: true, question_id: params[:question_id])
	if @vote
		@vote.destroy #click it again to remove the upvote
	else
		@vote = current_user.question_votes.new(question_id:params[:question_id], vote_type: true)
		@vote.save
		@save = true
		# @status = "Remove Vote".to_json
	end

		 # @abc = QuestionVotes.where(question_id: params[:question_id], vote_type: true)
		 # return @abc.to_json

	@count = QuestionVote.where(question_id: params[:question_id], vote_type: true).count
	@id = params[:question_id]

	@array = [@save, @count, @id]
	# @hash[save] = @save
	# @hash[count] = @count


	return  @array.to_json
	# # redirect '/homepage'



end

post '/questions/:question_id/down_vote' do


	@downvote = current_user.question_votes.find_by(user_id: current_user.id, vote_type: false, question_id: params[:question_id])

	if @downvote 
		@downvote.destroy
	else
		@down_vote = current_user.question_votes.new(question_id:params[:question_id], vote_type: false)
		@down_vote.save
		@savedown = true
	end

	@countdown = QuestionVote.where(question_id: params[:question_id], vote_type: false).count
	@id = params[:question_id]

	@array_down = [@savedown, @countdown, @id]
	return @array_down.to_json

	# if @down_vote.save || @downn_vote.destroy
	# 	redirect '/homepage'
	# else
	# 	@flash_msg = @down_vote.errors.full_messages
	# end

end