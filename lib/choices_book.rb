require 'yaml/store'
require_relative 'page_option'

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

class ChoicesPage
  attr_reader :text, :options

  def initialize(page)
    @text = page['text']
    @options =
      page['options'].map do |text, page|
        PageOption.new(text, page)
      end.append(PageOption.exit_option)
  end

  def option_characters
    options.map { |option| option.character }
  end

  def option(chosen_option)
    next_page = options
      .find { |option| option.character == chosen_option }
      .page
  end
end
