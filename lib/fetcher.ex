defmodule Fetcher do
  alias Wallaby.Query
  def fetch(request, client_options) do
    # Start new browser session, with some extra parameters
    {:ok, session} =
      Wallaby.start_session(
        capabilities: %{
          javascriptEnabled: true,
          chromeOptions: %{args: ["--headless"]}
        }
      )

    # Navigate to the URL
    wall = Wallaby.Browser.visit(session, request.url)

    # wait react loading
    Process.sleep(5000)

    # Take a screenshot and page source
    body =
      wall
      |> Wallaby.Browser.take_screenshot()
      |> Wallaby.Browser.page_source()

    url = Wallaby.Browser.current_url(session)

    # Don't forget to release resource, so you don't end up with millions of opened
    # browser windows
    :ok = Wallaby.end_session(session)

    # Finally return a structure which looks like a HTTPoison response
    {:ok, %HTTPoison.Response{status_code: 200, body: body, request_url: url}}
  end
end
