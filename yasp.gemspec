lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'yasp'
  s.version       = '2.0.2'
  s.date          = '2014-12-04'
  s.summary       = "Yet Another SCAD Program/YASP Ain't an SCAD Program"
  s.description   = "a small, no-nonsense DSL for SCAD in Ruby"
  s.authors       = ["Robert Sheldon"]
  s.email         = 'rsheldiii@gmail.com'
  s.files         = `git ls-files`.split($/)
  s.require_paths = ["lib"]
  s.homepage      = 'https://github.com/rsheldiii/YASP'
  s.license       = 'MIT'
end
