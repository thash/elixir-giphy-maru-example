defmodule FakeHttpClient do
  def get(_url) do
    {:ok, %HTTPoison.Response{body: <<1,2,3,4,5,6>>}}
  end
end
