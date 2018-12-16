
class Calculadora

  attr_reader :view
  attr_reader :first_field
  attr_reader :second_field
  attr_reader :button_sum
  attr_reader :result_text

  def initialize(timeout = 50)
    fill_variables
    # begin
    #   wait_true(timeout) { $driver.exists { $driver.find_element :id, @view } }
    # rescue
    #   raise "Elemento de id: '#{@view}' nao encontrado"
    # end
  end

  def fill_variables
    @view = 'navigationBarBackground'
    @first_field = 'android_field_first_number'
    @second_field = 'android_field_second_number'
    @button_sum = 'android_button_sum'
    @button_subtract = 'android_button_sub'
    @button_divide = 'android_button_div'
    @result_text = 'android_result_text'
  end

  def fill_first_number(number)
    $driver.find_element(:id, @first_field).send_keys(number)
  end

  def fill_second_number(number)
    $driver.find_element(:id, @second_field).send_keys(number)
  end

  def touch_sum_button
    $driver.find_element(:id, @button_sum).click
  end

  def touch_subtract_button
    $driver.find_element(:id, @button_subtract).click
  end

  def touch_divide_button
    $driver.find_element(:id, @button_divide).click
  end

  def text
    $driver.find_element(:id, @result_text).text
  end
end
