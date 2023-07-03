require 'logger'

class BattleLog
  def self.logger
    log_path = ENV.fetch('LOG_PATH', 'battle_log.txt')
    logger = Logger.new(log_path)
    logger.formatter = proc { |_, datetime, _, msg| "#{datetime}, #{msg}\n" }
    logger.datetime_format = '%Y-%m-%d %H:%M'
    logger
  end
end
