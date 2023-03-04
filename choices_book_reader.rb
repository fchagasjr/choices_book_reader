require 'io/console'
require_relative 'input'
require_relative 'choices_book'

class ChoicesBookReader
  attr_reader :book, :test_mode

  def initialize(book: "frog_book.yml", test_mode: false)
    @book = ChoicesBook.new(book)
    @test_mode = test_mode
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
    system("clear") unless test_mode
    puts book.text
    build_menu
  end

  def get_user_choice
    options = book.options
    Input.get_option(options, test_mode)
  end

  def build_menu
    book.options.keys.each do |option|
      option_letter = option[0].downcase
      puts "[#{option_letter}] #{option.upcase}"
    end
    puts "\n[x] EXIT"
  end
end

if __FILE__==$0
  ChoicesBookReader.new(test_mode: true).read
end