class Enrolls < ActiveRecord::Migration
  def up
   create_table "enrolls" do |t|
    t.references  'user'
    t.references  'course'
   end
  end

  def down
   drop_table 'enrolls'
  end
end
