require "sinatra"
require "octokit"

get "/" do
  erb :index
end

get "/repositories" do
  @repositories = octokit_client.repositories

  erb :repositories
end

delete "/repositories" do
  repositories = params[:repositories]

  @responses = []

  repositories.each do |repository|
    octokit_client.delete_repo(repository)
    @responses << [repository, "Deleted"]
  rescue => e
    @responses << [repository, e]
    next
  end

  erb :delete
end

private

def octokit_client
  @client ||= Octokit::Client.new(access_token: params[:fine_grained_access_token])
end
