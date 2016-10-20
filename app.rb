require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'
require 'sinatra/flash'

set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

enable :sessions
set :sessions => true

# $user = User.find(session[:user_id])

get '/' do
  @users = User.all
  erb :home
end



get '/signup' do

	erb :signup
end

post '/signup' do
	@user = User.create(username: params[:username], password: params[:password], email: params[:email])
	session[:user_id] = @user.id
	puts @user
	redirect '/post'
end

get '/signin' do

	erb :signin
end

post '/signin' do 
	@user = User.find_by(username: params[:username], password: params[:password])
	# session[:user_id] = @user.id
		if @user &&@user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/post'

	else
		redirect '/signup'
		
	end
end

get "/signout" do 
  session[:user_id] = nil
  redirect '/'
end

get '/user/:id' do 
  @user = User.find(params[:id])
  erb :account
end

get '/post' do 
  @posts = Post.all
  @user = User.find(session[:user_id])
  erb :post
end

post '/post' do 
  
erb :post
end

get '/account' do 
	@user = User.find(session[:user_id])
	erb :account
end

post '/update' do
	
	@user = User.find(session[:user_id])
	@user = @user.update(username: params[:username], password: params[:password], email: params[:email])
	redirect '/account'
end


get "/delete_account" do
  @user = User.find(session[:user_id])
  User.find(@user).destroy

  redirect './'
end









