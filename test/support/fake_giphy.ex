defmodule FakeGiphy do
  def random(_theme) do
    %{"data" => %{"image_url" => "a_url"}}
  end
end
