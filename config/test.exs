use Mix.Config

config :gif_generator,
  generator: FakeGifGenerator,
  giphy: FakeGiphy,
  http_client: FakeHttpClient
