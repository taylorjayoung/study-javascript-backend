# Study JavaScript Backend

This application allows users to view and create collections resembling flashcards with questions and answers. Users can view collections to study JavaScript - functions, definitions, methods, data-structures, and algorithms. 

## Contents

- [Getting Started](#getting_started)
- [Built With](#built_with)
- [Versioning](#versioning)
- [Models](#models)
- [Demo](#demo)
- [Deployment](#deployment)

## Getting Started

Fork and clone this repository. `cd` into directory. Run `bundle install` for required gems. Run `rake db:migrate` to run table migrations. Use rails server command in terminal `rails s` to launch a web server to access application through web browser.

Ensure to run installation for frontend for full application: [Front-End](https://github.com/sinyoungnam/study-javascript-frontend)

## Built With

Collaborated with another web-developer on backend developed with Ruby on Rails with following the RESTful convention to implement CRUD as a JSON API.

## Versioning

* Ruby version 2.6.1
* Rails 5.2.1

## Models

### Users

A user has many collections, questions, and comments. User needs a name, username, email, and password.

### Collections

Collections have many questions and belongs to a user.

### Questions

Questions have many comments and belongs to a user.

### Comments

Comments belong to questions and a user.

## Demo

In Progress

## Deployment

[Live on Heroku](https://study-js-frontend.herokuapp.com/)
