require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require	'gravtastic'
require './models'


enable :sessions

set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

get '/' do
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
  erb :user
end

get '/thread/:id' do 
  @post = Post.find(params[:id])
  erb :thread
end

get '/post' do 
  @posts = Post.all
  erb :post
end