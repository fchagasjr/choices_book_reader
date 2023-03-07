require_relative 'page_clearer'

class Input
  attr_reader :available_options, :page_clearer

  def self.get_option(options, page_clearer: PageClearer)
    new(options, page_clearer: page_clearer).get_option
  end

  def initialize(options, page_clearer: PageClearer)
    @available_options = handle_options(options)
    @page_clearer = page_clearer
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
    page_clearer.clear_page
    exit
  end
end

