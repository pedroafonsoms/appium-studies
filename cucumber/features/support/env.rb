require 'appium_lib'
require 'allure-cucumber'
require 'pry'

# Create a World class for it doesn't pollute `Object` class with Appium methods
class AppiumWorld
end

# Promoting AppiumWorld class to "Word" of Cucumber
World do
  AppiumWorld.new
end

caps = Appium.load_appium_txt\
  file: File.expand_path("../../../caps/#{ENV['PLATFORM']}.txt", __FILE__),\
  verbose: true

Appium::Driver.new(caps, true)
Appium.promote_appium_methods AppiumWorld

Before { start_driver }

After do |scenario|
  if scenario.failed?
    file_absouth_path = File.expand_path(\
      "../../../screenshot/#{ENV['PLATFORM'].downcase}/screenshot_#{Time.now.strftime('%Y%m%d%H%M%S')}.png",\
      __FILE__
    )
    screenshot(file_absouth_path)
  end
  driver_quit
end
