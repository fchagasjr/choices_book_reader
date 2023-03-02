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
      next_page = get_user_choice
      @page = Story.page(next_page)
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

  def build_menu
    page.options.each do |letter, _|
      option_text = Story.options[letter]
      puts "[#{letter}] #{option_text}"
    end
    puts "[x] EXIT"
 end
end

AdventureBook.new.read