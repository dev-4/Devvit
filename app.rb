require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require	'gravtastic'
require './models'

enable :sessions
set :sessions => true
set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

get '/' do
	@user = User.find(session[:user_id]) if session[:user_id]
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
		if @user &&@user.password == params[:password]
		session[:user_id] = @user.id
		redirect '/post'
	else
		redirect '/signup'
	end
end

get "/signout" do
@session = session 
@session.destroy
  # session[:user_id] = nil
  redirect '/'
end

get '/user/:id' do 
  @view_user = User.find(params[:id])
  @user = User.find(session[:user_id])
  erb :user
end

get '/thread/:id' do 
	@user = User.find(session[:user_id])
  @post = Post.find(params[:id])
  erb :thread
end

get '/newthread' do
	@user = User.find(session[:user_id])
	erb :newthread
end

post '/newthread' do
	@user = User.find(session[:user_id])
	post = Post.create(user_id: session[:user_id], title: params[:title], content: params[:message])
	redirect "/thread/#{post.id}"
end

post '/thread' do
	comment = Comment.create(post_id: params[:post_id], user_id: session[:user_id], content: params[:message])
	redirect "/thread/#{comment.post.id}"
end

get '/post' do 
  @posts = Post.all
  @user = User.find(session[:user_id])
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












# get '/signup' do

# 	erb :signup

# end

# post '/signup' do
# 	@user = User.create(username: params[:username], password: params[:password], email: params[:email])
# 	session[:user_id] = @user.id
# 	puts @user

# 	redirect '/post'

# end

# get '/signin' do


# 	erb :signin
# end

# post '/signin' do 
# 	@user = User.find_by(username: params[:username], password: params[:password])
# 	session[:user_id] = @user.id

# 	redirect '/post'
# end

# get "/signout" do 
#   session[:user_id] = nil
#   redirect '/'
# end

# get '/user/:id' do 
#   @user = User.find(params[:id])
#   erb :account
# end

# get '/post' do 
#   @posts = Post.all
#   @user = User.find(session[:user_id])
#   erb :post
# end

# post '/post' do 
  
# erb :post
# end

# get '/account' do 
# @user = User.find(session[:user_id])
# erb :account
# 	end

# post '/update' do
# 	@updated_user = User.update(username: params[:username], password: params[:password], email: params[:email])
# 	@user = User.find_by(username: params[:username])
# 	session[:user_id] = @user.id

# redirect '/account'
# end

