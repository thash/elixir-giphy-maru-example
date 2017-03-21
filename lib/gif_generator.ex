defmodule GifGenerator do
  # don't refer (mockable) modules directly.
  @giphy Application.get_env(:gif_generator, :giphy)
  @http_client Application.get_env(:gif_generator, :http_client)

  def generate(theme) do
    with {:ok, url} <- image_url(theme),
         {:ok, binary} <- download_image(url) do
      {:ok, binary}
    end
  end

  def image_url(theme) do
    %{"data" => %{"image_url" => image_url}} =
      @giphy.random(theme)

      {:ok, image_url}
  end

  def download_image(url) do
    {:ok, %HTTPoison.Response{body: binary}} =
      @http_client.get(url)

    {:ok, binary}
  end
end
