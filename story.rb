require 'yaml/store'


class Story
  attr_reader :actual_page, :pages, :menu_options

  def initialize(book: "book.yml")
    @pages = YAML::Store.new(book)
    @actual_page = 0
    @menu_options = { "y" => "YES", "n" => "NO"}
  end

  def change_page(number)
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

  def build_menu
    options.each do |letter, _|
      option_text = menu_options[letter]
      puts "[#{letter}] #{option_text}"
    end
    puts "[x] EXIT"
  end
end