require 'io/console'

class App
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

  attr_reader :page

  def initialize
    @page = 0
  end

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

  def read_book
    while true
      system("clear")
      puts STORY[page]
      input = user_input
      puts "#{input}"
      sleep(2)
      case input
      when "yes"
        @page += 1
      when "no"
        @page = 0
      when "exit"
        break
      end
    end
  end
end

App.new.read_book