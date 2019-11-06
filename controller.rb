require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/student.rb')
require_relative('./models/house.rb')
also_reload('./models/*')

get '/hogwarts' do
  @students = Student.all()
  erb(:index)
end

get '/hogwarts/new' do
  erb(:new)
end

# get '/hogwarts/new' do
#   @house = House.new(params)
#   erb(:new)
# end

post '/hogwarts' do
  @student = Student.new(params)
  @student.save()
  redirect to '/hogwarts'
end
