#This file is app/controllers/sessions_controller.rb
class HomeController < ApplicationController
def index
puts "curr value of user type #{session[:user_type]}"
end
end
