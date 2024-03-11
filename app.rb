require "sinatra"
require "octokit"

get "/" do
  erb :index
end

get "/repositories" do
  access_token = params[:fine_grained_access_token]
  @client = Octokit::Client.new(access_token: access_token)
  @repositories = @client.repositories

  erb :repositories
end
