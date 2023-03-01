class Input
  def self.get_option(options)
    characters = available_characters(options)
    build_menu(options)
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

  def self.build_menu(options)
    options.each do |option|
      case option.first
      when "y"
        puts "[y] YES"
      when "n"
        puts "[n] NO"
      end
    end
    puts "[x] EXIT"
 end
end

