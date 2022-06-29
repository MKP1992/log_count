# Ruby APP

Simple page view log parser.

## Requirements

* [Ruby 2.6.5](https://www.ruby-lang.org/en/documentation/installation/)

## Development
```
$ gem intall bundler
$ bundle install
```
### Run tests
```
$ bundle exec rspec
```

### Linting
```
$ bundle exec rubocop
```

### EXEC Command

ruby main.rb filepath


#After reviewing the code, There is optimization is need

1. Factory Pattern is good to used here:
   a. Total count file used to call in fatory for total count.
   b. Unique count file used to call in fatory for unique count.

then if we have to update anything we only have to touch the these 2 files, Also we used a sorter in Factory. but I am not sure as of now.

