defmodule Betstats.VictiiSpider do
  use Crawly.Spider
  alias Betstats.VictiiParser

  @victii_url "https://victti-dev.com.br/bet-stats?leagues=cblol"

  @impl Crawly.Spider
  def base_url(), do: @victii_url

  @impl Crawly.Spider
  def init() do
    [start_urls: [@victii_url]]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    items = VictiiParser.parse(response)
    %{items: items, requests: [%Crawly.Request{}]}
  end
end
