Gem::Specification.new do |s| 
  s.name             = "honsolo"
  s.version          = "0.0.1"
  s.author           = "Kien La"
  s.email            = "la.kien@gmail.com"
  s.homepage         = "http://github.com/kla/honsolo/tree/master"
  s.summary          = "Ruby library for querying game information from Heroes of Newerth"
  #s.files            = Dir["**/*"].reject { |f| f =~ /\.gemspec$/ }
  s.files = ["test", "test/character_test.rb", "test/honsolo_test.rb", "test/test_helper.rb", "test/clan_test.rb", "Rakefile", "lib", "lib/honsolo", "lib/honsolo/clan.rb", "lib/honsolo/character.rb", "lib/honsolo.rb", "README.md", "LICENSE"]
  s.require_path     = "lib"
  s.test_files       = Dir["test/**/*"]
  s.has_rdoc         = false

  s.add_dependency("uhees-php-serialize", ">= 1.1.0")
end
