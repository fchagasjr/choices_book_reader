require 'io/console'

STORY = [
  "Welcome to your story! Bad news: You're a frog!
    Long story short, a beatiful woman approaches the pond,
  somehow grab you and try to kiss you.
    Do you try to escape?",
  "Okay, you did it! You jump back into the pond and swim away.
You look back and see the next frog she grab got kissed. It turned
into a man! You eat a fly.
  THE END",
  "She kisses you and you start feeling something wierd. Your body
streched and you realize you became human. The woman claim to
be a princess and request you to follow her back to her castle.
  Do you accept her request?",
  "You don't take orders from frogs or people you just met. You
  walk away and not far from there you found a small town.
    Do you enter in the town?",
  "Before you can ask the first person where you are, the local guards arrest
you and lock you in the dungeon apparently for life. You've been
naked the whole time.
  THE END"
  ]

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
  counter ||= 0
  puts STORY[counter]
  input = user_input
  puts "#{input}"
  sleep(2)
  case input
  when "yes"
    counter += 1
  when "no"
    counter = 0
  when "exit"
    break
  end
end