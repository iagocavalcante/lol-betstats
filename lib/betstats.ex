defmodule Betstats do
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url(), do: "https://victti-dev.com.br/bet-stats?leagues=cblol"

  @impl Crawly.Spider
  def init() do
    [start_urls: ["https://victti-dev.com.br/bet-stats?leagues=cblol"]]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    # Parse response body to document
    {:ok, document} = Floki.parse_document(response.body)

    Logger.info("Parsing item from #{response.request_url}")
    # Create item (for pages where items exists)
    items =
      document
      |> Floki.find(".table")
      |> Floki.find(".cell")
      |> Enum.map(fn x ->
        %{
          data: Floki.find(x, ".cell") |> Floki.text()
        }
      end)

    # organize items in a map to be returned, create a map for chunks of 25
    items =
      Enum.chunk_every(items, 25)
      |> Enum.map(fn item ->
        %{
          team: Enum.at(item, 0).data,
          games: Enum.at(item, 1).data,
          winrate: Enum.at(item, 2).data,
          match_time: Enum.at(item, 3).data,
          first_blood: Enum.at(item, 4).data,
          first_lava: Enum.at(item, 5).data,
          first_harold: Enum.at(item, 6).data,
          first_tower: Enum.at(item, 7).data,
          first_dragon: Enum.at(item, 8).data,
          first_baron: Enum.at(item, 9).data,
          gold: Enum.at(item, 10).data,
          kills: Enum.at(item, 11).data,
          deaths: Enum.at(item, 12).data,
          towers: Enum.at(item, 13).data,
          total_gold: Enum.at(item, 14).data,
          total_kills: Enum.at(item, 15).data,
          total_towers: Enum.at(item, 16).data,
          total_dragons: Enum.at(item, 17).data,
          total_barons: Enum.at(item, 18).data,
          tower_11_5: Enum.at(item, 19).data,
          tower_12_5: Enum.at(item, 20).data,
          drag_4_5: Enum.at(item, 21).data,
          drag_5_5: Enum.at(item, 22).data,
          baron_1_5: Enum.at(item, 23).data,
          inibitor: Enum.at(item, 24).data
        }
      end)

    Logger.info("Parsed #{length(items)} items from #{response.request_url}")

    %{items: items, requests: []}
  end
end
