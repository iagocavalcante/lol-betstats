defmodule Betstats.VictiiParser do
  def parse(response) do
    {:ok, document} = Floki.parse_document(response.body)

    :logger.info("Parsing item from #{response.request_url}")

    items =
      document
      |> Floki.find(".table")
      |> Floki.find(".cell")
      |> Enum.map(fn x ->
        %{
          data: Floki.find(x, ".cell") |> Floki.text()
        }
      end)

    items =
      Enum.chunk_every(items, 28)
      |> Enum.map(fn [
                       team,
                       games,
                       winrate,
                       winrate_blue,
                       winrate_red,
                       match_time,
                       first_blood,
                       first_larva,
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
                       total_larvas,
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
          winrate_blue: winrate_blue.data,
          winrate_red: winrate_red.data,
          match_time: match_time.data,
          first_blood: first_blood.data,
          first_lava: first_larva.data,
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
          total_larvas: total_larvas.data,
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

    items
  end
end
