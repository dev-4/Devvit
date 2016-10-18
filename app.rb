require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

get '/' do
  # @users = User.all
  erb :home
end

get '/signup' do
	erb :signup
end

get '/signin' do
	erb :signin
end

get '/company/:id' do 
  @company = User.find(params[:id])
  erb :company_profile
end

# get '/company/new' do
#   erb :new_company
# end

post '/' do
  # to do: accept this form data
  # and save out a new company
  @user = User.create( params )
  erb :home
end

# get '/jobs' do
#   @jobs = Job.all
#   erb :jobs
# end

# # to do: Company profile page