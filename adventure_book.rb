require 'io/console'
require_relative 'input'
require_relative 'story'

class AdventureBook
  attr_reader :book

  def initialize(book_template = Story)
    @book = book_template.new
  end

  def read
    while true
      display_current_page
      next_page = get_user_choice
      @book.change_page(next_page)
    end
  end

  private

  def display_current_page
    system("clear")
    puts book.text
    book.build_menu
  end

  def get_user_choice
    options = book.options
    Input.get_option(options)
  end
end

AdventureBook.new.read