# RUBY-CEP-API

## Goal
The main goal is to create Ruby On Rails API to create
addresses on database when request an address by cep to the API.

## Features
- Endpoint to generate token by email and password
- Endpoint to search address by cep and save this address with the user that made that request

## How to run

To run this code you should first install all dependencies

```shell
bundle install
```
After this execute the seeds

```shell
rails db:seed
```

With these configured, just start the application

```shell
rails server -b 0.0.0.0 -p 3000 -e development
```

To run the tests

```shell
rspec
```

