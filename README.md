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
- `rake spec:client` # Run all client specs
- `rake build:client` # Builds client
- `rake start` # Starts application API and client
## Deployment
```sh
git push heroku master
```
## Endpoints
- `/stories` # Hacker News top stories
- `/stories/search?term=` # Search through stored stories
- `/health` # Health check endpoint
## Known Issues
- Story json response publishedAt timezone
- Console is printing warning messages because of Pry issues with current Ruby version
- API endpoints are exposed
## References
- [Hacker News API](https://github.com/HackerNews/API)
- [RSpec 3.9](https://relishapp.com/rspec/rspec-expectations/v/3-9/docs)
- [Faker Generators](https://github.com/faker-ruby/faker#generators)
- [Faraday](https://lostisland.github.io/faraday/usage/)