# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "http"
# Provider.delete_all
# Provider.reset_pk_sequence

API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
API_KEY = ENV["YELP_KEY"]

DEFAULT_BUSINESS_ID = "yelp-new-york-city"
DEFAULT_TERM = "laundry"
DEFAULT_LOCATION = "New York, NY"
SEARCH_LIMIT = 50

def search(term, location)
    url = "https://api.yelp.com/v3/businesses/search?location=newyork&categories=laundryservices"
    # "#{API_HOST}#{SEARCH_PATH}/category?=laundryservices"
    params = {
      term: term,
      location: location,
      limit: SEARCH_LIMIT
    }
    response = HTTP.auth("Bearer #{API_KEY}").get(url)
    response.parse
end

laundromats = search("", "New York City")

laundromats["businesses"].each do |laundromat|
    if Provider.all.find_by(name: laundromat["name"])
    else
        Provider.create!({
            name: laundromat["name"],
            image: laundromat["image_url"],
            address: laundromat["location"]["display_address"].join(" "),
            longitude: laundromat["coordinates"]["longitude"],
            latitude: laundromat["coordinates"]["latitude"],
            category: laundromat["categories"][0]["title"],
            borough: laundromat["location"]["city"],
            password: "yelpapi123"
        })
     
    end
end

puts "seeded"
