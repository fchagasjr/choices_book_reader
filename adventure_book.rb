require 'io/console'
require_relative 'input'
require_relative 'story'

class AdventureBook
  attr_reader :page

  def initialize
    @page = Story.page
  end

  def read
    while true
      display_current_page
      input = get_user_choice
      handle_input(input)
    end
  end

  private

  def display_current_page
    system("clear")
    puts page.text
    build_menu
  end

  def get_user_choice
    options = page.options
    Input.get_option(options)
  end

  def handle_input(input)
    exit if input.nil?
    @page = Story.page(input)
  end

  def build_menu
    page.options.each do |option|
      option_letter = option.first
      option_text = Story.options[option_letter]
      puts "[#{option_letter}] #{option_text}"
    end
    puts "[x] EXIT"
 end
end

AdventureBook.new.read