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
      page_option = get_user_choice(current_page)
      page_number = current_page.option(page_option)
      current_page = book.page(page_number)
    end
    page_clearer.clear_page
  end

  private

  def display(page)
    page_clearer.clear_page
    puts page.text
    build_menu(page)
  end

  def get_user_choice(page)
    options = page.option_characters
    input.get_option(options)
  end

  def build_menu(page)
    page.options.each do |option|
      puts "\n" if option.page == nil # to segregate [x] EXIT
      puts "[#{option.character}] #{option.text}"
    end
  end
end
