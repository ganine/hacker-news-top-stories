# Hacker News Top Stories

## Setup
### Prerequisites
- [Ruby 2.7.0](https://www.ruby-lang.org/en/documentation/installation/)
- [PostgreSQL 12.1](https://www.postgresql.org/docs/12/tutorial-install.html)
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- ChromeDriver
```sh
brew tap homebrew/cask && brew cask install chromedriver
```
### Installation
```sh
bundle install
```
```sh
rake db:setup
```
### Heroku
```sh
heroku apps:create
```
```sh
heroku buildpacks:add heroku/nodejs --index 1
heroku buildpacks:add heroku/ruby --index 2
```
## Tasks
- `rake build:client` # Builds client
- `rake start` # Starts application API and client
## Deployment
```sh
git push heroku master
```
## Endpoints
- `/health` # Health check endpoint
## Known Issues
- For some reason the health check route declared in config.ru isn't been available when running system tests
