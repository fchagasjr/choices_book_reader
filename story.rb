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
        "Do you allowed her to kiss?\n\n",
      options: {"y" => 3, "n" => 2}
    },
    2 => {
      text:
        "Okay, you escape the kiss and jump back into the pond and swim away.\n" +
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
      options: {"y" => 4, "n" => 5}
    },
    4 => {
      text:
        "You follow her, but on the first opportunity she stunts you.\n" +
        "She is no princess, she is a witch who works as slave trader on the weekends.\n" +
        "No happy ending for you. Just a lot of unpaid work.\n\n" +
        "THE END\n\n" ,
      options: {}
    },
    5 => {
      text:
        "You don't take orders from frogs or people you just met.\n" +
        "You walk away and not far from there you find a small town.\n\n" +
        "Do you enter in the town?\n\n",
      options: {"y" => 6, "n" => 7}
    },
    6 => {
      text:
        "You try to ask where you are to the first person you see.\n" +
        "But before that, the guards arrest you and lock you in the dungeon for life.\n" +
        "You've been naked the whole time and apparently this is crime.\n\n" +
        "THE END\n\n",
      options:  {}
    },
    7 => {
     text:
        "You cross path with some monks that wondered why you're naked.\n" +
        "They give you some food and clothes and offer you to follow them.\n\n" +
        "Do you accept the offer?\n\n",
      options:  {"y" => :fix_me, "n" => :fix_me}
    }
  }

    def self.page(number = 1)
      page_text = PAGES[number][:text]
      page_options = PAGES[number][:options]
      Page.new(page_text, page_options)
    end

    def self.options
      {
        "y" => "YES",
        "n" => "NO"
      }
    end
end