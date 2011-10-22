# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mongo_san/version"

Gem::Specification.new do |s|
  s.name        = "mongo_san"
  s.version     = MongoSan::VERSION
  s.authors     = ["Trevor Power"]
  s.email       = ["trevor_power@yahoo.com"]
  s.homepage    = ""
  s.summary     = %q{Allow easy backup and restore of mongo databases for heroku hosted apps.}
  s.description = %q{Allow easy backup and restore of mongo databases for heroku hosted apps.}

  #s.rubyforge_project = "mongo_sans"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency "heroku_san"
end
