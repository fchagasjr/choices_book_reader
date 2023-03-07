require 'yaml/store'

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
    actual_page['options']
  end
end