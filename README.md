# README

# Tea Time [![CircleCI](https://circleci.com/gh/idaolson/tea-time/tree/main.svg?style=shield)](https://app.circleci.com/pipelines/github/idaolson/tea-time)

## Table of contents
* [Contributor](#contributor)
* [Description](#description)
* [Database Schema](#schema)
* [Endpoints](#endpoints)
* [Requirements](#requirements)
* [Setup](#setup)
* [Tools Used](#tools-used)
* [Project Board](#project-board)


## Contributor

- [Ida Olson](https://github.com/idaolson/)


## Description

Rails API for a Tea Subscription Service


## Schema


![tea_time_schema](https://user-images.githubusercontent.com/81930253/149042430-45bbf67b-d1ae-4dd4-8c23-dea3f1969032.jpg)

## Endpoints

### Create a new subscription: 

   - POST     /api/v1/subscriptions
   - Body of request: 
   
   ```json
   {
       "title": "My weekly oolong",
       "price": 7.99,
       "status": "active",
       "frequency": 7,
       "quantity": 2,
       "customer_id": 1,
       "tea_id": 2
   }
   
   ```

### Cancel a subscription: 

  - PATCH    /api/v1/subscriptions/:id

### Get all subscriptions for a customer: 

  - GET      /api/v1/customers/:customer_id/subscriptions

## Requirements
- Rails 5.2.5
- Ruby 2.7.2
- PostgreSQL
- CircleCI
- Test-driven development

## Setup
* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle install`
    * `rails db:{create,migrate}`
    * `rails db:seed`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Tools Used

| Development         |  Testing        |
| :------------------:| :--------------:|
| Ruby 2.7.2          | RSpec           |
| Rails 5.2.6         | CircleCI        |
| PostgreSQL          |                 |
| Postman             |                 |
| Git                 |                 |
| JSON:API Serializer |                 |
|                     |                 |

## Project Board

[Tea Time Service](https://github.com/users/idaolson/projects/1)
