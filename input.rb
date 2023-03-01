class Input
  def self.get_option(options)
    characters = available_characters(options)
    while true
      chosen_option = STDIN.getch
      return options[chosen_option] if characters.include?(chosen_option)
    end
  end

  def self.available_characters(options)
    options.each_with_object(["x"]) do |option, chars|
      chars << option.first
    end
  end
end

