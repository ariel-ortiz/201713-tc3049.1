require 'sinatra'

set :port, ENV['PORT'] || 8080
set :bind, '0.0.0.0'

get '/' do
  'Hello world!'
end

get '/other' do
  @title = "Some title"
  @feelings = ['Joy', 'Anger', 'Disgust',
               'Sadness', 'Fear']
  erb :other
end