defmodule Betstats.LolEsportsSpider do
  use Crawly.Spider
  alias Betstats.LolesportsParser

  @lol_esports_url "https://lolesports.com/schedule?leagues=cblol-brazil"

  @impl Crawly.Spider
  def base_url(), do: @lol_esports_url

  @impl Crawly.Spider
  def init() do
    [start_urls: [@lol_esports_url]]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    items = LolesportsParser.parse(response)
    %{items: items, requests: [%Crawly.Request{}]}
  end
end
