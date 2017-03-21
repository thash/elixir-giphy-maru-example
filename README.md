# Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gif_generator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:gif_generator, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/gif_generator](https://hexdocs.pm/gif_generator).

# memo

https://hex.pm/ ... search "giphy"

```ruby
# Type "mix help deps" for more examples and options
defp deps do
  [{:giphy_ex, "~> 0.1.0"}]
end
```

```
$ mix deps.get
$ mix deps.compile
```

=> ready to run alnogside the app

```ruby
$ iex -S mix
Compiling 1 file (.ex)
Generated gif_generator app

iex(2)> GiphyEx.Gifs.random("banana")
%{"meta" => %{"error_code" => "invalid_api_key", "msg" => "Unauthorized",
    "response_id" => "58d132e36b12477211ceb58b", "status" => 401}}
```

we need balid API key

https://github.com/Giphy/GiphyAPI
> The public beta key is "dc6zaTOxFJmzC”

=> paste into config.exs

```ruby
iex(1)> GiphyEx.Gifs.random("cat")
%{"data" => %{"caption" => "", "fixed_height_downsampled_height" => "200",
    "fixed_height_downsampled_url" => "http://media0.giphy.com/media/CdqNOCOc8Lcw8/200_d.gif",
...
  "meta" => %{"msg" => "OK", "response_id" => "58d13342f43d8df174cf07da",
    "status" => 200}}
```

OK.

Elixir like methods:

```ruby
  def image_url(theme) do
    %{"data" => %{"image_url" => image_url}} =
      GiphyEx.Gifs.random(theme)

      {:ok, image_url}
  end

  def generate(theme) do
    with {:ok, url} <- image_url(theme),
         {:ok, binary} <- download_image(url) do
      {:ok, binary}
    end
  end
```


```
$ MIX_ENV=test mix test
```

when testing, all gif API performed.
to avoid this, use different modules during test => fakes.
