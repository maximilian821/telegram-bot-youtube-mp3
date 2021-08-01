Simple telegram bot for converting youtube video into mp3 file.

## Installation

Clone this repository:

```
git clone https://github.com/maximilian821/telegram-bot-youtube-mp3.git
```

Install **youtube-dl** (Command-line program to download videos from YouTube)

```
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

sudo chmod a+rx /usr/local/bin/youtube-dl
```

Install **FFmpeg** (Command-line tool for converting video and audio formats)

```
sudo apt-get install ffmpeg
```

Execute bundler:

```
bundler
```

[Obtain a token](https://core.telegram.org/bots#6-botfather) for your bot. Then add it to access the HTTP API:

```ruby
# main.rb

token = 'YOUR_TELEGRAM_BOT_API_TOKEN'
```

Run the application:

```
ruby main.rb
```
