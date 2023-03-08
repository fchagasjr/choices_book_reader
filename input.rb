require_relative 'page_clearer'
require_relative 'input_key'

class Input
  attr_reader :available_options, :page_clearer, :input_key

  def self.get_option(options,
                      page_clearer: PageClearer,
                      input_key: InputKey)
    new(options,
        page_clearer: page_clearer,
        input_key: input_key).get_option
  end

  def initialize(options,
                 page_clearer: PageClearer,
                 input_key: InputKey)
    @available_options = handle_options(options)
    @page_clearer = page_clearer
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

  def handle_options(options)
    options.each_with_object({}) do |option, characters|
      option_letter = option.character
      characters[option_letter] = option.page
    end
  end

  def handle_output(chosen_option)
    if available_options.keys.include?(chosen_option)
      chosen_option
    elsif chosen_option == "x"
      exit_application
    end
  end

  def exit_application
    page_clearer.clear_page
    exit
  end
end

