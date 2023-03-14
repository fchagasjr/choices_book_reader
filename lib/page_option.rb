class PageOption
  attr_reader :character, :text, :page

  def self.exit_option
    new('exit', character: 'x')
  end

  def initialize(text, page = nil, character: nil)
    @character = character || text.downcase.chr
    @text = text.upcase
    @page = page
  end
end