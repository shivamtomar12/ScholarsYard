class UpdateQuizidInQuiz < ActiveRecord::Migration
  def change
  	change_column :quizzes, :quizid, :integer
  end

end
