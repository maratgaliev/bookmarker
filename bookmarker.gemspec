# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)

require "bookmarker/version"

Gem::Specification.new do |s|
  s.name        = "bookmarker"
  s.version     = Bookmarker::VERSION
  s.authors     = ["Marat Galiev"]
  s.email       = ["kazanlug@gmail.com"]
  s.homepage    = "https://github.com/maratgaliev/bookmarker"
  s.summary     = "Add bookmarks to your models"
  s.description = "Simple add bookmarks functionality to your models"
  s.test_files = Dir["test/**/*"]
  s.add_dependency "rails", "~> 3.2.12"
  s.require_paths = ["lib"]  
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
end
