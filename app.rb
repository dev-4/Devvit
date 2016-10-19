require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

get '/' do
  @users = User.all
  erb :home
end

get '/signup' do
	erb :signup
end

get '/signin' do
	erb :signin
end

get '/user/:id' do 
  @user = User.find(params[:id])
  erb :account
end

get '/post' do 
  @posts = Post.all
  erb :post
end

post '/post' do 
  
erb :post
end

# post '/' do
#   # to do: accept this form data
#   # and save out a new company
#   @user = User.create( params )
#   erb :home
# end

