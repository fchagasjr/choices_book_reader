require 'io/console'
require_relative 'input'
require_relative 'choices_book'

class ChoicesBookReader
  attr_reader :book, :input

  def initialize(book: "frog_book.yml", input: Input)
    @book = ChoicesBook.new(book)
    @input = input
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
    system("clear") unless testing?
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

  def testing?
    input == TestInput
  end
end

if __FILE__==$0
  ChoicesBookReader.new(input: TestInput).read
end