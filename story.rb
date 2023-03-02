require 'yaml/store'

Page = Struct.new(:text, :options)

class Story
  @options = {
    "y" => "YES",
    "n" => "NO"
  }

  attr_reader :pages

  def self.page(number = 1)
    new.page(number)
  end

  def initialize
    @pages = YAML::Store.new("book.yml")
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