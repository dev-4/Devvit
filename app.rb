require 'sinatra'
require 'sinatra/activerecord'
require 'sqlite3'
require './models'

set :database, {adapter: 'sqlite3', database: 'devvit.sqlite3'}

get '/' do
  # @companies = Company.all
  erb :home
end

# get '/company/new' do
#   erb :new_company
# end

# post '/company/new' do
#   # to do: accept this form data
#   # and save out a new company
#   @company = Company.create( params )
#   erb :new_company
# end

# get '/jobs' do
#   @jobs = Job.all
#   erb :jobs
# end

# # to do: Company profile page