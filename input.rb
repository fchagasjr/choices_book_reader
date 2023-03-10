class Input
  attr_reader :input_key

  def initialize(input_key:)
    @input_key = input_key
  end

  def get_option(options)
    output = nil
    until output
      chosen_option = input_key.get_key
      output = handle_output(options, chosen_option)
    end
    output
  end

  private

  def handle_output(options, chosen_option)
    options.find { |option| option == chosen_option}
  end
end

