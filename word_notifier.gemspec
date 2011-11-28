# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "word_notifier/version"

Gem::Specification.new do |s|
  s.name        = "word_notifier"
  s.version     = WordNotifier::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Notify you word every several minutes."]
  s.email       = ["Notify you word every several minutes."]
  s.homepage    = ""
  s.summary     = %q{Notify you word every several minutes.}
  s.description = %q{Notify you word every several minutes.}

  s.rubyforge_project = "word_notifier"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
