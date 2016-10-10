post '/up_votes/:question_id' do
# post '/questions/:question_id/up_vote'
	@vote = current_user.question_votes.find_by(user_id: current_user.id, vote_type: true) if current_user
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

	@array = [@save, @count]
	# @hash[save] = @save
	# @hash[count] = @count

	return  @array.to_json
	# # redirect '/homepage'



end

post '/down_votes/:question_id' do


	if current_user.question_votes.find_by(vote_type: false) == nil

		@down_vote = current_user.question_votes.new(user_id: current_user.id, question_id:params[:question_id], vote_type: false)
		@down_vote.save
	else 

		@down_vote = current_user.question_votes.find_by(user_id: current_user.id, vote_type: false)
		@down_vote.destroy
	end

	if @down_vote.save || @downn_vote.destroy
		redirect '/homepage'
	else
		@flash_msg = @down_vote.errors.full_messages
	end

end