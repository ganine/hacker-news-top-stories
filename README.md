# Hacker News Top Stories

https://hn-top-stories.herokuapp.com/

## Setup

### Prerequisites

- [Ruby 2.7.0](https://www.ruby-lang.org/en/documentation/installation/)
- [Bundler](https://bundler.io/)
- [PostgreSQL 12.1](https://www.postgresql.org/docs/12/tutorial-install.html)
- [ChromeDriver](https://chromedriver.chromium.org/)
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)

### Installation

Install dependencies

```sh
bundle install
```

Setup database

```sh
rake db:setup
```

### Heroku

Create app

```sh
heroku apps:create
```

Add buildpacks

```sh
heroku buildpacks:add heroku/nodejs --index 1
heroku buildpacks:add heroku/ruby --index 2
```

## Tasks

| Task                    | Description                                             |
| ----------------------- | :------------------------------------------------------ |
| `rake spec`             | Run all specs                                           |
| `rake spec:unit`        | Run unit tests (Models, Presenters)                     |
| `rake spec:integration` | Run integration tests (APIs, Interactors, Repositories) |
| `rake spec:acceptance`  | Run acceptance tests (Features)                         |
| `rake spec:client`      | Run all client specs                                    |
| `rake build:client`     | Builds client                                           |
| `rake start`            | Starts application API and client                       |

## Deployment

```sh
git push heroku master
```

## Endpoints

| Endpoint                | Description                   |
| ----------------------- | :---------------------------- |
| `/stories`              | Hacker News top stories       |
| `/stories/:id/comments` | List relevant story comments  |
| `/stories/search?term=` | Search through stored stories |
| `/health`               | Health check endpoint         |

## Known Issues

- Story json response publishedAt timezone
- Console is printing warning messages because of Pry issues with current Ruby version
- API endpoints are exposed

## TODO
- extract Stories and Comments client components
- improve client tests
- improve search with pg fulltext and include comments content
- make item_id as primary keys
- optimize VCR cassettes configurations
- extract api fetch interactors
- rename /stories endpoint to /top-stories
- rename /comments endpoint to /relevant-comments

## References

- [Hacker News API](https://github.com/HackerNews/API)
- [RSpec 3.9](https://relishapp.com/rspec/rspec-expectations/v/3-9/docs)
- [Faker Generators](https://github.com/faker-ruby/faker#generators)
- [Faraday](https://lostisland.github.io/faraday/usage/)
