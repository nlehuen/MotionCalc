$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'motion-cocoapods'

Motion::Project::App.setup do |app|
  app.name = 'Nicomputer'
  app.version = '0.5'
  app.identifier = 'com.lehuen.nicomputer'
  app.device_family = [:iphone, :ipad]

  app.codesign_certificate = 'iPhone Developer: Nicolas Lehuen (T5EN53LQD4)'

  app.pods do
    dependency 'JSONKit'
  end
end
