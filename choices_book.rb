require 'yaml/store'
require_relative 'page_option'

class ChoicesBook
  attr_reader :current_page, :pages

  def initialize(book_file_path)
    @pages = YAML::Store.new(book_file_path)
    to_page(0)
  end

  def to_page(number)
    pages.transaction do
      @current_page = number ? pages[number] : nil
    end
  end

  def text
    current_page['text']
  end

  def options
    exit_option = PageOption.create_exit_option
    current_page['options'].map do |text, page|
      PageOption.new(text, page)
    end.append(exit_option)
  end

  def to_option_page(chosen_option)
    next_page = options
      .find { |option| option.character == chosen_option }
      .page

    to_page(next_page)
  end

  def option_characters
    options.map { |option| option.character }
  end
end
