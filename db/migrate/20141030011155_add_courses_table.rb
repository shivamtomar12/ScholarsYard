class AddCoursesTable < ActiveRecord::Migration
  def up
  	create_table :courses do |t|
  		t.string :course_name
  		t.text :course_description
  		t.string :resources
  		t.boolean :is_active
  		t.boolean :is_deprecated
  	end
  end

  def down
  end
end
