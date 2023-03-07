require_relative 'choices_book_reader'
require_relative 'input'

class AutoInput < Input
  private

  def get_key
    pressed_key = available_test_keys.sample
    puts "\nPressed key:[#{pressed_key}]\n\n"
    pressed_key
  end

  def available_test_keys
    "a".upto("z")
       .to_a
       .sample(2)
       .append("x")
       .concat(available_options.keys)
  end
end


class NullPageClearer
  def self.clear_page
    # no-op
  end
end

ChoicesBookReader.new(input: AutoInput, page_clearer: NullPageClearer).read
