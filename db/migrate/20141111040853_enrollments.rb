class Enrollments < ActiveRecord::Migration
  def up
   create_table "enrollments" do |t|
    t.references  'user'
    t.references  'course'
   end
  end

  def down
   drop_table 'enrollments'
  end
end
