require 'yaml/store'


class Story
  Page = Struct.new(:text, :options)

  @options = {
    "y" => "YES",
    "n" => "NO"
  }

  attr_reader :pages

  def self.page(number = 0)
    new.page(number)
  end

  def initialize(book: "book.yml")
    @pages = YAML::Store.new(book)
  end

  def page(number)
    pages.transaction do
      actual_page = pages[number]
      page_text = actual_page['text']
      page_options = actual_page['options']
      Page.new(page_text, page_options)
    end
  end

  def self.options
    @options
  end
end