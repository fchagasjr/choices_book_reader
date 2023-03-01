require 'io/console'

def user_input
  options = {
    "y" => "yes",
    "n" => "no",
    "x" => "exit"
  }
  options.each do |option, action|
    puts "[#{option}] #{action}"
  end
  while true
    option = STDIN.getch
    return options[option] if options.keys.include?(option)
  end
end

while true
  system("clear")
  input = user_input
  puts "#{input}"
  sleep(2)
  break if input == "exit"
end