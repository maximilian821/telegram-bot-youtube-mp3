require 'telegram/bot'
require_relative 'audio'
include AudioProcessor

token = 'YOUR_TELEGRAM_BOT_API_TOKEN'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello! Send me youtube video link and I'll give you the audio file from it.")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye!")
    else
      link = message.text
      if yt_link?(link)
        bot.api.send_message(chat_id: message.chat.id, text: "Please wait. Audio file is downloading...")
        # Downloads mp3 file locally
        if get_audio(link)
          # Gets the name of the file stored in /tmp folder
          file_name = audio_file(link)
          begin
            bot.api.send_audio(chat_id: message.chat.id, audio: Faraday::UploadIO.new("./tmp/#{file_name}", 'audio/mpeg'))
            File.delete("./tmp/#{file_name}")
          rescue
            bot.api.send_message(chat_id: message.chat.id, text: "Something went wrong...")
          end
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Too heavy file. Maximum size is 50 megabytes.")
        end
      else
        bot.api.send_message(chat_id: message.chat.id, text: "This is not a youtube video link.")
      end
    end
  end
end