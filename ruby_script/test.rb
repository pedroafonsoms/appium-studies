
require 'appium_lib'
require 'pry'

def assert_equal(actual, expect)
  raise "Resultado #{actual} não confere com #{expect}" unless actual.eql? expect
rescue Exception => e
  puts e.message
end

# Finds file toml and loading methods with caps
caps_path = File.join(File.dirname(__FILE__), 'appium.txt')
caps = Appium.load_appium_txt file: caps_path, verbose: true
# binding.pry

# Loading capabilities in the appium driver
Appium::Driver.new(caps, true)

# Driver must be global, not anyother
$driver.start_driver

first_field = $driver.find_element :id, 'android_field_first_number'
second_field = $driver.find_element :id, 'android_field_second_number'

first_field.send_keys 20
second_field.send_keys 30

$driver.find_element(:id, 'android_button_sum').click

result = $driver.find_element(:id, 'android_result_text')
assert_equal result.text, '50'

$driver.quit_driver
