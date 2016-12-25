Gem::Specification.new do |s|
  s.name        = 'hooktheory'
  s.version     = '1.0.0'
  s.date        = '2016-12-24'
  s.summary     = "Ruby client for the hooktheory API."
  s.description = "A ruby wrapper around the Hooktheory API, useful for finding information for songs that have a particular chord progression. View the original API documentation here: See original API documentation here: https://www.hooktheory.com/api/trends/docs"
  s.authors     = ["Marshall Hattersley"]
  s.email       = 'mwhatters@gmail.com'
  s.files       = ["lib/hooktheory.rb", "lib/hooktheory/client.rb", "lib/hooktheory/node.rb", "lib/hooktheory/song.rb"]
  s.homepage    = 'http://rubygems.org/gems/hooktheory'
  s.license     = 'MIT'

  s.add_runtime_dependency 'json', '~> 1.8'
  s.add_runtime_dependency 'httparty', '~> 0.14', '>= 0.14.0'
  s.required_ruby_version = '>= 2.1.6'
end
