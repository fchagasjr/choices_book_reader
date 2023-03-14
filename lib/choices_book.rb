require 'yaml/store'
require_relative 'choices_page'

class ChoicesBook
  attr_reader :current_page, :pages

  def initialize(book_file_path)
    @pages = YAML::Store.new(book_file_path)
  end

  def cover
    page(0)
  end

  def page(number)
    pages.transaction do
      number ? ChoicesPage.new(pages[number]) : nil
    end
  end
end
