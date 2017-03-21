defmodule GifGeneratorTest do
  use ExUnit.Case
  doctest GifGenerator

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "generate" do
    assert GifGenerator.generate("foo") == {:ok, <<1,2,3,4,5,6>>}
  end
end
