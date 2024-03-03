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
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, extension: "json", folder: "./data"}
  ]
