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
      |> Enum.map(fn [
                       team,
                       games,
                       winrate,
                       match_time,
                       first_blood,
                       first_lava,
                       first_harold,
                       first_tower,
                       first_dragon,
                       first_baron,
                       gold,
                       kills,
                       deaths,
                       towers,
                       total_gold,
                       total_kills,
                       total_towers,
                       total_dragons,
                       total_barons,
                       tower_11_5,
                       tower_12_5,
                       drag_4_5,
                       drag_5_5,
                       baron_1_5,
                       inibitor
                     ] ->
        %{
          team: team.data,
          games: games.data,
          winrate: winrate.data,
          match_time: match_time.data,
          first_blood: first_blood.data,
          first_lava: first_lava.data,
          first_harold: first_harold.data,
          first_tower: first_tower.data,
          first_dragon: first_dragon.data,
          first_baron: first_baron.data,
          gold: gold.data,
          kills: kills.data,
          deaths: deaths.data,
          towers: towers.data,
          total_gold: total_gold.data,
          total_kills: total_kills.data,
          total_towers: total_towers.data,
          total_dragons: total_dragons.data,
          total_barons: total_barons.data,
          tower_11_5: tower_11_5.data,
          tower_12_5: tower_12_5.data,
          drag_4_5: drag_4_5.data,
          drag_5_5: drag_5_5.data,
          baron_1_5: baron_1_5.data,
          inibitor: inibitor.data
        }
      end)

    Logger.info("Parsed #{length(items)} items from #{response.request_url}")

    %{items: items, requests: []}
  end
end
