defmodule FakeGifGenerator do
  # warning: variable "theme" is unused ... => replace theme to _theme. it suppresses unused warnings
  def generate(_theme) do
    {:ok, <<1,2,3,4,5>>}
  end
end
