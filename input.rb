class Input
  def self.get_option(options)
    new(options).get_option
  end

  attr_reader :available_options

  def initialize(options)
    @available_options = handle_options(options)
  end

  def get_option
    output = nil
    until output
      chosen_option = STDIN.getch
      output = handle_output(chosen_option)
    end
    output
  end

  private

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
      system("clear")
      exit
    end
  end
end

