Gem::Specification.new do |s|
  s.name        = 'store-ratings'
  s.version     = '0.0.1'
  s.date        = '2018-12-10'
  s.summary     = "A gem to return rating for your iOS or Android apps."
  s.description = "This is a simple to use gem that does one thing; Returns the rating of your iOS or Android app."
  s.authors     = ["Rasmus Styrk"]
  s.email       = 'styrken@gmail.com'
  s.files       = ["lib/store-rating.rb"]
  s.homepage    = 'http://rubygems.org/gems/store-ratings'
  s.license       = 'MIT'

  s.add_dependency('nokogiri', '>= 0')
end
