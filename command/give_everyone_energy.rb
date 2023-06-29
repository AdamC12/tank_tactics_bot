require_relative './base'

module Command
  class GiveEveryoneEnergy < Command::Base
    def name
      :give_everyone_energy
    end

    def description
      "Distribute daily energy"
    end

    def execute(event:)
      user = event.user
      player = Player.find_by(discord_id: user.id)

      unless player.admin
        event.respond(content: "Sorry! Only admins can do this!")
        return
      end

      players = Player.all
      players.each do |player|
        player.update(energy: player.energy + 1) if player.alive
      end

      BattleLog.logger.info("Everyone got their daily energy")
      event.respond(content: "Energy successfully distributed")

    rescue => e
      event.respond(content: "An error has occurred: #{e}")
    end
  end
end