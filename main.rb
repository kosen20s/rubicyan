require 'discordrb'
bot = Discordrb::Bot.new(
    token: ENV["RUBITYAN_T"],
    client_id: ENV["CLIENT_ID"],
    prefix: ':rubi'
)

bot.message :help do |event|
    event.respond 'LaminneがRubyで書いてるぼっとです。以上'
end

bot.command :connect do |event|
    channel = event.user.voice_channel
    next "Voice Channelに入ってからコマンドを打ってね" unless channel
    bot.voice_connect(channel)
    "{channel.name}に入りました。"
  end

  bot.command :hoge do |event|
    event.voice.play_file("/home/yosotsu/work/hoge.mp3")
  end
  
  bot.command :stop do |event|
    event.voice.stop_playing
  end
  
  bot.command :pause do |event|
    event.voice.pause
  end
  
  bot.command :continue do |event|
    event.voice.continue
  end

  bot.command :playlist do |event|
    musicList = []
    Dir.chdir("music/") do 
      Dir.glob("*") do |m|
        musicList.push(m)
      end
    end
    musicList.join("/n")
  end
  
  bot.command :play do |event,m|
    if File.exist?("music/#{m}.mp3")
      event.voice.play_file("music/#{m}.mp3")
    else
      "ファイルがありません"
    end
  end
bot.run