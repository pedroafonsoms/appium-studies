require 'appium_lib'
require 'pry'

# Create a World class for it doesn't pollute `Object` class with Appium methods
class AppiumWorld
end

caps = Appium.load_appium_txt\
  file: File.expand_path("../../../caps/#{ENV['PLATFORM']}.txt", __FILE__),\
  verbose: true

Appium::Driver.new(caps, true)
Appium.promote_appium_methods AppiumWorld

# Promoting AppiumWorld class to "Word" of Cucumber
World do
  AppiumWorld.new
end

Before { start_driver }

After { driver_quit }
