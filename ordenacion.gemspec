# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ordenacion/version"

Gem::Specification.new do |s|
  s.name        = "ordenacion"
  s.version     = Ordenacion::VERSION
  s.authors     = ["Cristo Gonzalez | Juvenal Santiso"]
  s.email       = ["alu0100694987@ull.edu.es"] # | alu0100696585@ull.edu.es
  s.homepage    = ""
  s.summary     = %q{Creacion de matrices}
  s.description = %q{Permite representar y realizar operaciones con matrices densas y dispersas}

  s.rubyforge_project = "ordenacion"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rake"  
  s.add_development_dependency "rspec"
  #s.add_development_dependency "guard-rspec"
  #s.add_development_dependency "guard-bundler"
end
