require 'rspec'
require 'train'
require "rider"
require 'pry'
require 'PG'

DB = PG.connect({:dbname => 'train_system'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
    DB.exec("DELETE FROM riders *;")
  end
end
