require 'yaml/store'

class ChoicesBook
  attr_reader :actual_page, :pages

  def initialize(book: "frog_book.yml")
    @pages = YAML::Store.new(book)
    @actual_page = 0
  end

  def to_page(number)
    @actual_page = number
  end

  def text
    pages.transaction do
      page = pages[actual_page]
      page['text']
    end
  end

  def options
    pages.transaction do
      page = pages[actual_page]
      page['options']
    end
  end
end