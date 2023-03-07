require_relative 'choices_book_reader'
require_relative 'input'

class AutoInput
  TEST_KEYS = %w[o y n x]

  def self.get_key
    pressed_key = TEST_KEYS.shift
    puts "\nPressed key:[#{pressed_key}]\n\n"
    pressed_key
  end
end

class NullPageClearer
  def self.clear_page
    # no-op
  end
end

ChoicesBookReader.new(input: Input, input_key: AutoInput, page_clearer: NullPageClearer).read
