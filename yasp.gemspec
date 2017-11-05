lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'YASP'
  s.version     = '2.0.0'
  s.date        = '2014-012-04'
  s.summary     = "Yet Another SCAD Program/YASP Ain't an SCAD Program"
  s.description = "a small, no-nonsense DSL for SCAD in Ruby"
  s.authors     = ["Robert Sheldon"]
  s.email       = 'rsheldiii@gmail.com'
  s.files       = `git ls-files`.split($/)
  s.require_paths = ["lib"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
