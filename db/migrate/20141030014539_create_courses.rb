class CreateCourses < ActiveRecord::Migration
  def change_table


     add_column(:courses, :created_at, :datetime)
      add_column(:courses, :updated_at, :datetime)
    
  end
end
