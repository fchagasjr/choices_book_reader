class Story
  Page = Struct.new(:text, :options)

  PAGES = {
    fix_me:{
      text:
        "not done yet\n\n",
      options: {}
    },
    1 => {
      text:
        "Welcome to your story! Bad news: You're a frog!\n" +
        "Long story short, a beatiful woman approaches the pond, somehow grab you and try to kiss you.\n\n" +
        "Do you try to escape?\n\n",
      options: {"y" => 2, "n" => 3}
    },
    2 => {
      text:
        "Okay, you did it! You jump back into the pond and swim away.\n" +
        "You look back and see the next frog she grab got kissed.\n" +
        "It turned into a man! You eat a fly.\n\n" +
        "THE END\n\n" ,
      options: {}
    },
    3 => {
      text:
        "She kisses you and you start feeling something wierd.\n" +
        "Your body streched and you realize you became human.\n" +
        "The woman claim to be a princess and request you to follow her.\n\n" +
        "Do you accept her request?\n\n",
      options: {"y" => :fix_me, "n" => 4}

    },
    4 => {
      text:
        "You don't take orders from frogs or people you just met.\n" +
        "You walk away and not far from there you found a small town.\n\n" +
        "Do you enter in the town?\n\n",
      options: {"y" => 5, "n" => :fix_me}
    },
    5 => {
      text:
        "You try to ask the first person you see where you are.\n" +
        "But before that the guards arrest you and lock you in the dungeon for life.\n" +
        "You've been naked the whole time and apparently this is crime.\n\n" +
        "THE END\n\n",
      options:  {}
    }
  }

    def self.page(number = 1)
      page_text = PAGES[number][:text]
      page_options = PAGES[number][:options]
      Page.new(page_text, page_options)
    end
end