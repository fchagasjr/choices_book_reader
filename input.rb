class Input
  attr_reader :available_options

  def self.get_option(options, test_mode = false)
    if test_mode
      AutoInput
    else
      self
    end.new(options).get_option
  end

  def initialize(options)
    @available_options = handle_options(options)
  end

  def get_option
    output = nil
    until output
      chosen_option = get_key
      output = handle_output(chosen_option)
    end
    output
  end

  private

  def get_key
    STDIN.getch
  end

  def handle_options(options)
    options.each_with_object({}) do |option, characters|
      option_letter = option.first[0].downcase
      characters[option_letter] = option.last
    end
  end

  def handle_output(chosen_option)
    if available_options.keys.include?(chosen_option)
      available_options[chosen_option]
    elsif chosen_option == "x"
      exit_application
    end
  end

  def exit_application
    system("clear")
    exit
  end
end

class AutoInput < Input
  private

  def get_key
    pressed_key = available_test_keys.sample
    puts "\nPressed key:[#{pressed_key}]\n\n"
    pressed_key
  end

  def exit_application
    puts "End of testing\nExiting application\n\n"
    exit
  end

  def available_test_keys
    "a".upto("z").to_a
                 .sample(2)
                 .append("x")
                 .concat(available_options.keys)
  end
end
