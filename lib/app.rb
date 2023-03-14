require_relative 'choices_book_reader'
require_relative 'page_clearer'
require_relative 'input_key'

ChoicesBookReader.new(input_key: InputKey, page_clearer: PageClearer).read
