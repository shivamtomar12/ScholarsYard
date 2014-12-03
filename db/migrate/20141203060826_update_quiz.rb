class UpdateQuiz < ActiveRecord::Migration
  def change
  	add_column :quizzes, :score, :string
  end

end
