# Git Gone
Easily remove multiple GitHub repositories at once.

## Installation
Git Gone is a simple Sinatra application that you can run locally or deploy to a server. To install, clone the repository and run `bundle install` to install the required gems.

### Deploy to Hetzner using Kamal
First, install Kamal by running `gem install kamal`. Next, create a server with Hetzner. Next, change the `config/deploy.yml` file and replace the image, servers, and registry with your information. Lastly, run `kamal setup` to deploy to your server.

### Deploy to Heroku
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/jimmypoulsen/git-gone/tree/main)

## Usage
To use Git Gone, you will need to create a GitHub personal access token. You can do this by going to your GitHub settings, selecting "Developer settings", then "Personal access tokens", and finally "Fine-grained tokens". Create a new token with the "repo" scope.

Once you have your token, you can run the application with `ruby app.rb`. You can then visit the application in your web browser and enter your token and select the repositories you want to delete.

## Disclaimer
This application is provided as-is and without warranty. Use at your own risk. Deleting repositories is permanent and cannot be undone. Always double-check the repositories you are deleting before confirming. The author of this application is not responsible for any data loss or other issues that may arise from using this application.
