
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "active_symbol/version"

Gem::Specification.new do |spec|
  spec.name          = "active_symbol"
  spec.version       = ActiveSymbol::VERSION
  spec.authors       = ["David Heitzman"]
  spec.email         = ["daveheitzman@yahoo.com"]

  spec.summary       = %q{Adds methods to symbols that allow easy generation of active record queries. }
  spec.description   = %q{ 
    The active record query interface doesn't support easy creation of queries to do anything
    other than matching by equality, or generating IN queries. 

    Inspired by mongo, active_symbol adds the ability to easily generate more advanced queries. 
  }
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rails", "~> 5.1"
  spec.add_development_dependency "sqlite3", "~> 1.3"
  spec.add_development_dependency "byebug", "~> 9.0"
  spec.add_development_dependency "awesome_print", "~> 1.8"
  spec.add_development_dependency "pg", "~> 0.18"
end
