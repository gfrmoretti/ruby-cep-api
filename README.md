# RUBY-CEP-API

## Goal
The main goal is to create Ruby On Rails API to create
addresses on database when request an address by cep to the API.

## Features
- Endpoint to generate token by email and password
- Endpoint to search address by cep and save this address with the user that made that request

## Study Case Highlights

- Cacheable endpoint
- Implement many-to-many relationship
- RestAPI external request
- Rails MVC concepts
- Token Authentication process
- Address endpoint performance

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
## Requests models

I create a file named [generated-requests](./generated-requests.http) with sample requests in the main endpoints
that was created in this API. To make easier to test the application use this request. 

Obs: This file is based on IDEA IntelliJ request generator, if you use IntelliJ you will can reproduce this requests
directly by your IDE, if not, you still can use to copy the request to an other API request like Postman.
