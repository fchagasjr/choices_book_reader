class Input
  def self.get_option(options)
    options.each do |option, action|
      puts "[#{option}] #{action}"
    end
    while true
      option = STDIN.getch
      return options[option] if options.keys.include?(option)
    end
  end
end
