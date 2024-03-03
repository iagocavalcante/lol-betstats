# Betstats

To start crawly, just run this command

#### Run spider for victii stats for bets
`iex -S mix run -e "Crawly.Engine.start_spider(Betstats.VictiiSpider)""`

#### Run spider for lol esports info for mathces
`iex -S mix run -e "Crawly.Engine.start_spider(Betstats.LolEsportsSpider)"`

