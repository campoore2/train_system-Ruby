require "sinatra"
require "sinatra/reloader"
require "pg"
also_reload "lib/**/*.rb"
require "./lib/train"
require "./lib/rider"
require "pry"

DB = PG.connect({:dbname => "train_system"})

get '/' do
  erb :index
end

get('/trains') do
  @trains = Train.all()
  erb(:trains)
end

get '/admin' do
  erb :admin
end
get('/admin/add_city_form') do
  erb(:add_city_form)
end

post('/add_city_form') do
  city = params.fetch('add_city')
  line = params.fetch('add_line')
  arriv = params.fetch('arr')
  depar = params.fetch('dep')
  train = Train.new({:line => line, :city => city, :depar => depar, :arriv => arriv})
  train.save()
  @trains = Train.all()
  erb(:admin)
end

get('/admin/add_line_form') do
  erb(:add_line_form)
end

post('/add_line_form') do
  line = params.fetch('add_line')
  city = params.fetch('add_city')
  arriv = params.fetch('arr')
  depar = params.fetch('dep')
  train = Train.new({:line => line, :city => city, :depar => depar, :arriv => arriv})
  train.save()
  @trains = Train.all()
  erb(:admin)
end

get('/admin/remove_city') do
  erb(:remove_city)
end
get('/admin/remove_line') do
  erb(:remove_line)
end
