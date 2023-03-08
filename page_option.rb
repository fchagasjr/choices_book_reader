class PageOption
  attr_reader :character, :text, :page

  def initialize(text, page, character: nil)
    @character = text.downcase.chr
    @text = text.upcase
    @page = page
  end
end