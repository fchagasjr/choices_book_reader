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
    current_page = book.cover
    while current_page
      display(current_page)
      next_page = get_user_choice(current_page)
      current_page = book.page(next_page)
    end
    page_clearer.clear_page
  end

  private

  def display(page)
    page_clearer.clear_page
    puts page.text
    puts page.menu
  end

  def get_user_choice(page)
    options = page.option_characters
    page_option = input.get_option(options)
    page.option(page_option)
  end
end
