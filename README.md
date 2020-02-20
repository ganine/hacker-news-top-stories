# Hacker News Top Stories

## Setup
### Prerequisites
- [Ruby 2.7.0](https://www.ruby-lang.org/en/documentation/installation/)
- [PostgreSQL 12.1](https://www.postgresql.org/docs/12/tutorial-install.html)
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
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
- `rake start` # Starts application api and client
## Deployment
```sh
git push heroku master
```
## Endpoints
- `/health` # Health check endpoint