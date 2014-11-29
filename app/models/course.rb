class Course < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :course_name, :course_description, :resources, :is_active, :is_deprecated, :instructor_email
  has_many :users, :through => :enrolls
  has_many :users, :through => :manages
   
  

end
