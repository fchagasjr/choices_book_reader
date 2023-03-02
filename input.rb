class Input
  def self.get_option(options)
    characters = available_characters(options)
    while true
      chosen_option = STDIN.getch
      if characters.include?(chosen_option)
        return options[chosen_option]

      elsif chosen_option == "x"
        exit
      end
    end
  end

  def self.available_characters(options)
    options.each_with_object([]) do |option, characters|
      characters << option.first
    end
  end
end

