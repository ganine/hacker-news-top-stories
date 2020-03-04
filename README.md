# Hacker News Top Stories

https://hn-top-stories.herokuapp.com/

## Architecture
I've designed it based on [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) ideas.

I tried to not get too far from Rails regular architecture to not difficult the onboarding of a seasoned Rails developer.

I've added new layers, restricted some Rails "magic" (like Active Record API) and reduced Rails' Model responsibilities (splitting into Presenters, Forms and Repositories).

### Concepts
- Models: acts like Entities or Value Objects, describes the behavior and express business rules.
- Repositories: responsible for retrieving and storing models from the persistence layer, ex: in a database or a file.
- Presenters: define presentation logic, contains the formatting rules according to the view, ex: page view or JSON response
- Interactors: aka use-cases, encapsulates and describes functionalities of the system. Coordinates Repositories and other Interactors to execute business tasks.

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
| `rake start`            | Starts application API and client                       |
| `rake spec`             | Run all specs                                           |
| `rake spec:unit`        | Run unit tests (Models, Presenters)                     |
| `rake spec:integration` | Run integration tests (APIs, Interactors, Repositories) |
| `rake spec:acceptance`  | Run acceptance tests (Features)                         |
| `rake spec:client`      | Run all client specs                                    |
| `rake build:client`     | Builds client                                           |

## Deployment

```sh
git push heroku master
```

## Endpoints

| Endpoint                    | Description                   |
| --------------------------- | :---------------------------- |
| `/api/stories`              | Hacker News top stories       |
| `/api/stories/:id/comments` | List relevant story comments  |
| `/api/stories/search?term=` | Search through stored stories |
| `/health`                   | Health check endpoint         |

## Known Issues

- Story json response publishedAt timezone
- Console is printing warning messages because of Pry issues with current Ruby version
- API endpoints are exposed

## TODO

- improve search with pg full-text and include comments content
- make item_id as primary keys
- extract api fetch interactors
- rename /stories endpoint to /top-stories
- rename /comments endpoint to /relevant-comments
- sanitize comment content before persist into database
- optimize VCR cassettes configurations
- create CSS variables for colors, fonts sizes, etc
- add a CSS preprocessor

## References

- [Hacker News API](https://github.com/HackerNews/API)
- [RSpec 3.9](https://relishapp.com/rspec/rspec-expectations/v/3-9/docs)
- [Faker Generators](https://github.com/faker-ruby/faker#generators)
- [Faraday](https://lostisland.github.io/faraday/usage/)
