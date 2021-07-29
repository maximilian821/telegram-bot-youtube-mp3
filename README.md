# Telegram bot (youtube video to mp3)

## Usage (running the application locally)

Clone this repository:

```
$ git clone https://github.com/maximilian821/telegram-bot-youtube-mp3.git
```

Execute bundler:

```
$ bundler
```

[Obtain a token](https://core.telegram.org/bots#6-botfather) for your bot. Then add it to access the HTTP API:

```ruby
# main.rb

token = 'YOUR_TELEGRAM_BOT_API_TOKEN'
```

Run the application:

```
$ ruby main.rb
```
