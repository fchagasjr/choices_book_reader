require_relative 'page_clearer'
require_relative 'input_key'

class Input
  attr_reader :available_options, :input_key

  def self.get_option(options,
                      input_key: InputKey)
    new(options,
        input_key: input_key).get_option
  end

  def initialize(options,
                 input_key: InputKey)
    @available_options = options
    @input_key = input_key
  end

  def get_option
    output = nil
    until output
      chosen_option = input_key.get_key
      output = handle_output(chosen_option)
    end
    output
  end

  private

  def handle_output(chosen_option)
    available_options.find { |option| option == chosen_option}
  end
end

