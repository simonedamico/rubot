require 'cinch'
require "cinch/plugins/identify"

bot = Cinch::Bot.new do
  configure do |c|
    c.plugins.plugins = [Cinch::Plugins::Identify]
    c.plugins.options[Cinch::Plugins::Identify] = {
      :username => "rubot",
      :password => ENV['IRC_PWD'],
      :type => :nickserv,
      
    }
    c.server = "irc.azzurra.org"
    c.channels = ["#polimi"]
    c.delay_joins = 5
    
    c.nick = "rubot"
    c.realname = "rubot"
    
    c.ssl.use = true
    c.port = 9999
           
  end

  on :message, /(js|javascript|node)/i do |m|
    if m.user.nick == "gattuso"
      m.reply "Sento puzza di gattusata"
    end
    
  end
end

bot.start
