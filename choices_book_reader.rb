require 'io/console'
require_relative 'input'
require_relative 'choices_book'
require_relative 'page_clearer'

class ChoicesBookReader
  attr_reader :book, :input, :page_clearer

  def initialize(book: "frog_book.yml",
                 input: Input,
                 page_clearer: PageClearer)
    @book = ChoicesBook.new(book)
    @input = input
    @page_clearer = page_clearer
  end

  def read
    while true
      display_current_page
      next_page = get_user_choice
      @book.to_page(next_page)
    end
  end

  private

  def display_current_page
    page_clearer.clear_page
    puts book.text
    build_menu
  end

  def get_user_choice
    options = book.options
    input.get_option(options)
  end

  def build_menu
    book.options.keys.each do |option|
      option_letter = option[0].downcase
      puts "[#{option_letter}] #{option.upcase}"
    end
    puts "\n[x] EXIT"
  end
end
