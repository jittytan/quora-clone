class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :answer_description
			t.string :question_id
			t.string :user_id
			t.timestamps null: false
		end
	end
end
