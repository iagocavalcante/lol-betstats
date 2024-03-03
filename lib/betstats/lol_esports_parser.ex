defmodule Betstats.LolesportsParser do
  def parse(response) do
    {:ok, document} = Floki.parse_document(response.body)

    :logger.info("Parsing item from #{response.request_url}")

    dates = document |> Floki.find(".EventDate") |> Enum.map(&Floki.text/1)

    match =
      document
      |> Floki.find(".EventMatch")
      |> Enum.map(fn item ->
        %{
          team1: Floki.find(item, ".EventMatch .team1 .team-info .name") |> Floki.text(),
          logo1:
            Floki.find(item, ".EventMatch .team1") |> Floki.find("img") |> Floki.attribute("src"),
          team2: Floki.find(item, ".EventMatch .team2 .team-info .name") |> Floki.text(),
          logo2:
            Floki.find(item, ".EventMatch .team2") |> Floki.find("img") |> Floki.attribute("src"),
          date: Floki.find(item, ".EventMatch .date") |> Floki.text(),
          league: Floki.find(item, ".EventMatch .league") |> Floki.find(".name") |> Floki.text(),
          best_of:
            Floki.find(item, ".EventMatch .league") |> Floki.find(".strategy") |> Floki.text(),
          score_team_1: Floki.find(item, ".EventMatch .score .scoreTeam1") |> Floki.text(),
          score_team_2: Floki.find(item, ".EventMatch .score .scoreTeam2") |> Floki.text()
        }
      end)

    # merge dates with match
    items =
      Enum.zip(dates, match) |> Enum.map(fn {date, match} -> Map.put(match, :date, date) end)

    :logger.info("Parsed #{length(items)} items from #{response.request_url}")
    items
  end
end
