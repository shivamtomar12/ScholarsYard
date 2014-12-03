class RecreateQuizTable < ActiveRecord::Migration
  	  drop_table :quizzes
      create_table :quizzes do |t|
	      t.string :studentemail
	      t.integer :quizid
	      t.string :quizanswer
	      t.string :quizquestion
	      t.timestamps
	  end
    
end
