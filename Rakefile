require 'rake'
require 'rake/testtask'

Rake::TestTask.new(:default) do |t|
    t.libs << "test"
    t.pattern = "test/**/*_test.rb"
    t.verbose = true
end
Rake::Task['test'].comment = "Run the tests"
