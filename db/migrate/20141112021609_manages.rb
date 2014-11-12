class Manages < ActiveRecord::Migration
  def up
    create_table "manages" do |t|
    t.references  'user'
    t.references  'course'
   end
  end

  def down
      drop_table 'manages'
  end
end



