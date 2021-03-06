# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'textbelt/version'

Gem::Specification.new do |spec|
  spec.name          = "textbelt"
  spec.version       = TextBelt::VERSION
  spec.authors       = ["Dean Silfen"]
  spec.email         = ["dean.silfen@gmail.com"]

  spec.summary       = %q{A ruby interface for sending texts with http://textbelt.com/}
  spec.description   = %q{A ruby interface for sending texts with http://textbelt.com/}
  spec.homepage      = "https://github.com/djds23/textbelt-gem"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  #  else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  #  end
  #  TODO: Add a server to push from, defend against this scenario

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  spec.add_runtime_dependency 'configurations', '~> 2.2.0'
  spec.add_runtime_dependency 'phonelib', '~> 0.5.4'

  spec.add_development_dependency "webmock", ["~> 1.22.3"]
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yard"
end
