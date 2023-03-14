require 'io/console'
require_relative 'input'
require_relative 'choices_book'

class ChoicesBookReader
  attr_reader :book, :input, :page_clearer

  def initialize(book: "data/frog_book.yml", input_key:, page_clearer:)
    @book = ChoicesBook.new(book)
    @input = Input.new(input_key: input_key)
    @page_clearer = page_clearer
  end

  def read
    while book.open?
      display_current_page
      page_option = get_user_choice
      book.to_option_page(page_option)
    end
    page_clearer.clear_page
  end

  private

  def display_current_page
    page_clearer.clear_page
    puts book.text
    build_menu
  end

  def get_user_choice
    options = book.option_characters
    input.get_option(options)
  end

  def build_menu
    book.options.each do |option|
      puts "\n" if option.page == nil # to segregate [x] EXIT
      puts "[#{option.character}] #{option.text}"
    end
  end
end
