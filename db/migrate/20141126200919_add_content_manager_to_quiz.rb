class AddContentManagerToQuiz < ActiveRecord::Migration
  def change
    add_column :surveys, :email, :string
  end
end
