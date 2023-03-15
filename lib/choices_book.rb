require 'yaml/store'
require_relative 'choices_page'

class ChoicesBook
  attr_reader :pages

  def initialize(book_file_path)
    @pages = YAML::Store.new(book_file_path)
  end

  def cover
    cover_page =
      pages.transaction do
        pages.roots.first
      end
    page(cover_page)
  end

  def page(number)
    pages.transaction do
      number ? ChoicesPage.new(pages[number]) : nil
    end
  end
end
