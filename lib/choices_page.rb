require_relative 'page_option'

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

  def menu
    options.each_with_object("") do |option, menu|
      menu.concat("\n") if option.page == nil # to segregate [x] EXIT
      menu.concat("[#{option.character}] #{option.text}\n")
    end
  end

end
