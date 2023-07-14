require_relative './base'
require_relative './helpers/generate_grid_message'

module Command
  class Instructions < Command::Base
    def name
      :instructions
    end

    def description
      "Instruction overview"
    end

    def execute(event:)
      instructions = "You are a tank and you have 3 HP, 2 range and 0 energy to start.\n" +
        "Everyone gets randomly placed on a grid. 10 energy a day gets distributed to everyone.\n" +
        "When energy is distributed, a heart will spawn on the grid that can be picked up to increase your HP\n" +
        "You can use that energy to:\n" +
        "- shoot (10 energy)\n" +
        "- move in any direction (5 energy) The world is 'round' so going off the edge will put you the other side\n" +
        "- upgrade your range (30 energy)\n" +
        "- gain a HP (30 energy)\n\n" +
        "You can also give energy and HP to other players within your range.\n" +
        "Just because you are dead, does not mean you are out. Someone can give you HP to revive you. You will return with however much HP was given to you\n" +
        "And the energy you died with.\n"

      event.respond(content: instructions, ephemeral: true)

    rescue => e
      event.respond(content: "An error has occurred: #{e}")
    end
  end
end
