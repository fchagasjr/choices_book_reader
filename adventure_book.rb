require 'io/console'
require_relative 'input'
require_relative 'story'

class AdventureBook
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
    @page = Story.page(1)
  end

  def read
    while true
      display_current_page
      input = get_user_choice
      handle_input(input)
    end
  end

  private

  def display_current_page
    system("clear")
    puts page.text
  end

  def get_user_choice
    options = page.options
    Input.get_option(options)
  end

  def handle_input(input)
    if input.nil?
      exit
    else
      @page = Story.page(input)
    end
  end
end

AdventureBook.new.read