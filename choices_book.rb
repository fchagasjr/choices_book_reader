require 'yaml/store'
require_relative 'page_option'

class ChoicesBook
  attr_reader :actual_page, :pages

  def initialize(book_file_path)
    @pages = YAML::Store.new(book_file_path)
    to_page(0)
  end

  def to_page(number)
    pages.transaction do
      @actual_page = pages[number]
    end
  end

  def text
    actual_page['text']
  end

  def options
    actual_page['options'].map do |text, page|
      PageOption.new(text, page)
    end
  end

  def to_option_page(chosen_option)
    if chosen_option == 'x'
      @actual_page = nil
    else
      next_page =
        options.find { |option| option.character == chosen_option}
               .page
      to_page(next_page)
    end
  end

  def option_characters
    options.map { |option| option.character }
  end
end
