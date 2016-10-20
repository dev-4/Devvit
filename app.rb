require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require	'gravtastic'
require './models'


enable :sessions
set :sessions => true

set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

get '/' do
  erb :home
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
	session[:user_id] = @user.id
 # to do: handle condition where no user is found
	redirect '/post'
end

get '/user/:id' do 
  @user = User.find(params[:id])
  erb :user
end

get '/thread/:id' do 
  @post = Post.find(params[:id])
  erb :thread
end

get '/newthread' do
	erb :newthread
end

post '/newthread' do
	post = Post.create(user_id: session[:user_id], title: params[:title], content: params[:message])
	# @post = comment.post
	redirect "/thread/#{post.id}"
end

post '/thread' do
	comment = Comment.create(post_id: params[:post_id], user_id: session[:user_id], content: params[:message])
	# @post = comment.post
	redirect "/thread/#{comment.post.id}"
end

get '/post' do 
  @posts = Post.all
  erb :post
end

# set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

# enable :sessions
# set :sessions => true

# # $user = User.find(session[:user_id])

# get '/' do
#   @users = User.all
#   erb :home
# end



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

