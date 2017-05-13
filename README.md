# Shoe Store

#### ActiveRecord Independent Project for Epicodus, 5/12/2017

#### By Monique St. Laurent

## Description

A website that allows users to track shoe brands and the stores they are in.

**User Stories**

* As a user, I want to be able to add, update, delete and list shoe stores.
* As a user, I want to be able to add and list new shoe brands. Shoe brands should include price.
* As a user, I want to be able to add shoe brands in the application (don't worry about updating,  listing or destroying shoe brands).
* As a user, I want to be able to add existing shoe brands to a store to show where they are sold.
* As a user, I want to be able to associate the same brand of shoes with multiple stores.
* As a user, I want to be able to see all of the brands a store sells on the individual store page.
* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.
* As a user, I want the price to be in currency format even if I just inputted a number. (In other words, typing in 50 should be updated to $50.00.)
* As a user, I do not want stores and/or shoe brands to be saved if I enter a blank name.
* As a user, I want all stores and brands to be unique. There shouldn't be two entries in the database for Blundstone.
* As a user, I want store and brand names to have a maximum of one hundred characters.

## Setup/Installation Requirements

Clone the repository: $ git clone https://github.com/moinstla/shoe-store.git'
Change to the project directory: 'cd shoe-store'
Install gems: 'bundle'
Create databases:
$ rake db:create
$ rake db:schema:load
Start the webserver: $ ruby app.rb
Navigate to localhost: 4567 in browser

## Technologies Used

Ruby
Sinatra
ActiveRecord
HTML
CSS
SQL
Bootstrap

### License

This software is available under the MIT License Copyright (c) 2017 Monique St. Laurent
