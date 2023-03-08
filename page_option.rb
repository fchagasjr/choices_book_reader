class PageOption
  attr_reader :character, :text, :page

  def initialize(text, page, character: nil)
    if character
      @character = character
    else
      @character = text.downcase.chr
    end
    @text = text.upcase
    @page = page
  end
end