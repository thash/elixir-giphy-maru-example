defmodule GifGenerator.API do
  use Maru.Router

  get do
    json(conn, %{ hello: :world })
  end

  # https://maru.readme.io/docs/router
  # NG (deprecated): route_param :theme do
  route_param :theme, type: String do
    # NG (deprecated): def get do
    get do
      {:ok, image} = params[:theme]
      |> GifGenerator.generate

      conn
      |> put_resp_content_type("image/gif")
      |> send_resp(200, image)
      |> halt
    end
  end
end
