
require 'appium_lib'
require 'pry'

# Create a World class for it doesn't pollute `Object` class with Appium methods
class AppiumWorld
end

caps_path = File.join(File.dirname(__FILE__), '..', '..', 'caps', "#{ENV['PLATFORM'].downcase}.txt")
caps = Appium.load_appium_txt file: caps_path, verbose: true

Appium::Driver.new(caps, true)
Appium.promote_appium_methods AppiumWorld

# Promoting AppiumWorld class to "Word" of Cucumber
World do
  AppiumWorld.new
end

Before { $driver.start_driver }

After { $driver.driver_quit }