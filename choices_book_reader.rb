require 'io/console'
require_relative 'input'
require_relative 'choices_book'
require_relative 'page_clearer'
require_relative 'input_key'

class ChoicesBookReader
  attr_reader :book, :input, :input_key, :page_clearer

  def initialize(book: "frog_book.yml",
                 input: Input,
                 input_key: InputKey,
                 page_clearer: PageClearer)
    @book = ChoicesBook.new(book)
    @input = input
    @input_key = input_key
    @page_clearer = page_clearer
  end

  def read
    while true
      display_current_page
      next_page = get_user_choice
      book.to_page(next_page)
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
    input.get_option(options, page_clearer: page_clearer, input_key: input_key)
  end

  def build_menu
    book.options.each do |option|
      puts "[#{option.character}] #{option.text}"
    end
    puts "\n[x] EXIT"
  end
end
