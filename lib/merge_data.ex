defmodule MergeData do
  # based on two json files, merge them into one with the following rules:
  # get matches and put stats in the same object for the teams that played

  @stats "data/Betstats.VictiiSpider_2024_03_06_00_12_08_026131_26b62502-db4e-11ee-90f7-7a41bf200175.json"
  @matches "data/Betstats.LolEsportsSpider_2024_03_06_00_01_56_611288_b8bd1a84-db4c-11ee-b240-7a41bf200175.json"

  @team_abreviation %{
    "KaBuM! Esports" => "KBM",
    "INTZ" => "ITZ",
    "FURIA" => "FUR",
    "RED Kalunga" => "RED",
    "FLUXO" => "FX",
    "paiN Gaming" => "PNG",
    "Vivo Keyd Stars" => "VKS",
    "LOS" => "LOS",
    "LOUD" => "LLL",
    "Liberty" => "LBR"
  }

  def merge() do
    stats = File.read!(@stats) |> Jason.decode!()
    matches = File.read!(@matches) |> Jason.decode!()

    data_structure =
      Enum.map(matches, fn match ->
        team_name_1 = match["team1"]
        team_name_2 = match["team2"]
        team_name_abreviation_1 = @team_abreviation[team_name_1]
        team_name_abreviation_2 = @team_abreviation[team_name_2]

        match_stats_team_1 =
          Enum.find(stats, fn stat -> stat["team"] == team_name_abreviation_1 end)

        match_stats_team_2 =
          Enum.find(stats, fn stat -> stat["team"] == team_name_abreviation_2 end)

        %{
          "date" => match["date"],
          "best_of" => match["best_of"],
          "league" => match["league"],
          "team1" => %{
            "team" => match["team1"],
            "stats" => match_stats_team_1,
            "logo" => Enum.at(match["logo1"], 0),
            "score" => match["score_team_1"]
          },
          "team2" => %{
            "team" => match["team2"],
            "stats" => match_stats_team_2,
            "logo" => Enum.at(match["logo2"], 0),
            "score" => match["score_team_2"]
          }
        }
      end)

    root_path = Path.expand("./lol-betstats/src/assets/merged_data.json")

    File.write!(root_path, Jason.encode!(data_structure))
  end
end
