# This file is automatically generated. Do not edit.

if Object.const_defined?('TestFlight') and !UIDevice.currentDevice.model.include?('Simulator')
  NSNotificationCenter.defaultCenter.addObserverForName(UIApplicationDidBecomeActiveNotification, object:nil, queue:nil, usingBlock:lambda do |notification|
  TestFlight.takeOff('7a4cdd9ca72f000111a156bdc456f1d7_ODc0MjUyMDEyLTA1LTA1IDA1OjMyOjIzLjE0NDExNQ')
  end)
end