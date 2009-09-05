require 'rake'

Gem::Specification.new do |s| 
  s.name             = "honsolo"
  s.version          = "0.0.1"
  s.author           = "Kien La"
  s.email            = "la.kien@gmail.com"
  s.homepage         = "http://github.com/kla/honsolo/tree/master"
  s.summary          = "Ruby library for querying game information from Heroes of Newerth"
  s.files            = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'test/**/*'].to_a
  s.require_path     = "lib"
  s.test_files       = Dir["test/**/*"]
  s.has_rdoc         = false

  s.add_dependency("uhees-php-serialize", ">= 1.1.0")
end
