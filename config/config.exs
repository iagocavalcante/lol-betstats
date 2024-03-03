import Config

config :crawly,
  fetcher: {Fetcher, []},
  closespider_timeout: :disabled,
  closespider_itemcount: :disabled,
  concurrent_requests_per_domain: 2,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent, user_agents: ["Crawly Bot", "Google"]}
  ],
  pipelines: [
    # An item is expected to have all fields defined in the fields list
    {Crawly.Pipelines.Validate,
     fields: [
       :team,
       :games,
       :winrate,
       :match_time,
       :first_blood,
       :first_lava,
       :first_harold,
       :first_tower,
       :first_dragon,
       :first_baron,
       :gold,
       :kills,
       :deaths,
       :towers,
       :total_gold,
       :total_kills,
       :total_towers,
       :total_dragons,
       :total_barons,
       :tower_11_5,
       :tower_12_5,
       :drag_4_5,
       :drag_5_5,
       :baron_1_5,
       :inibitor
     ]},

    # Use the following field as an item uniq identifier (pipeline) drops
    # items with the same urls
    {Crawly.Pipelines.DuplicatesFilter, item_id: :team},
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, extension: "json", folder: "./data"}
  ]
