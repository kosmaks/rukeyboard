Gem::Specification.new do |s|
  s.name        = "rukeyboard"
  s.version     = "0.0.1"
  s.date        = "2014-02-22"
  s.summary     = "Simulate key events from ruby."
  s.description = "Cross-platform solution for simulating mouse events"
  s.authors     = ["Maxim Kostuchenko"]
  s.email       = "kstmaks@gmail.com"
  s.files       = ["lib/rukeyboard.rb", 
                   "lib/rukeyboard/darwin.rb",
                   "lib/rukeyboard/win32.rb",
                   "lib/rukeyboard/x11.rb"]
  s.homepage    = ""
  s.license     = "MIT"

  s.add_runtime_dependency "ffi", "~> 1.9.3"
end
