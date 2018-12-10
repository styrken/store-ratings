# store-ratings
A gem to return rating for your iOS or Android apps.

## Installation

Add this line to your application's Gemfile to use the latest stable version:

    gem 'store-ratings'

And then execute:

    $ bundle
    
## iOS Rating

    require 'store-rating'
    rating = StoreRating::rating("284882215", "dk")
    puts "Rating is: #{rating.to_s}"
    
        
## Android Rating

    require 'store-rating'
    rating = StoreRating::rating("com.facebook.katana")
    puts "Rating is: #{rating.to_s}"
    
## Excessive Use

Google will block your IP address if you attempt to scrape large quantities of data.
