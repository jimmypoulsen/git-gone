require "sinatra"
require "octokit"

get "/" do
  erb :index
end

get "/up" do
  "Oh yeah"
end

get "/repositories" do
  begin
    @repositories = octokit_client.repositories
  rescue Octokit::Unauthorized => e
    redirect to "/"
  end

  erb :repositories
end

delete "/repositories" do
  repositories = params[:repositories]

  @responses = []

  if repositories.nil?
    @responses << ["No repositories selected", "Error"]
  else
    repositories.each do |repository|
      octokit_client.delete_repo(repository)
      @responses << [repository, "Deleted"]
    rescue => e
      @responses << [repository, e]
      next
    end
  end

  erb :delete
end

private

def octokit_client
  @client ||= Octokit::Client.new(access_token: params[:fine_grained_access_token])
end
