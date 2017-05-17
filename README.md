# CouchInn

## Requirements

- Rails 4.2.4
- Postgres depending on configuration
- (...) // TODO: list other requirements  

## Basic instructions

Make sure the requirements are installed, clone the project, cd into Web and then

```
bundle install --without production
rake db:reset
rails s
```

You can find in the ```seeds.rb``` file the default credentials for the seeded users.