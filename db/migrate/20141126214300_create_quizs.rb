class CreateQuizs < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.string :studentemail
      t.string :quizid
      t.string :quizanswer
      t.string :quizquestion
      t.timestamps
    end
  end

  def self.down
    drop_table :studentquiz
  end
end
