class Input
  attr_reader :available_options

  def self.get_option(options)
    new(options).get_option
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

class TestInput < Input
  class << self
    attr_accessor :test_runs
  end

  @test_runs = 0

  private

  def get_key
    sleep(2)
    pressed_key = test_keys.sample
    puts "Pressed key:[#{pressed_key}]\n\n"
    pressed_key
  end

  def exit_application
    puts "End of testing\nExiting application\n\n"
    exit
  end

  def test_keys
    self.class.test_runs += 1
    puts "\nTest:#{self.class.test_runs}"
    available_test_keys
  end

  def available_test_keys
    if self.class.test_runs > 2
      ["x"] + available_options.keys
    else
      available_options.keys
    end
  end
end
