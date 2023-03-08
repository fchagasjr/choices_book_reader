class PageOption
  attr_reader :character, :text, :page

  def self.create_exit_option
    option = new('exit', nil)
    option.set_exit_character
    option
  end

  def initialize(text, page)
    @character = text.downcase.chr
    @text = text.upcase
    @page = page
  end

  def set_exit_character
    @character = 'x'
  end
end