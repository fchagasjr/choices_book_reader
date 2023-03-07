require_relative 'choices_book_reader'

class NullPageClearer
  def self.clear_page
    # no-op
  end
end

ChoicesBookReader.new(test_mode: true, page_clearer: NullPageClearer).read
