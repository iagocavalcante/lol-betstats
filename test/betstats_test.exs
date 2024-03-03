defmodule BetstatsTest do
  use ExUnit.Case
  doctest Betstats

  test "greets the world" do
    assert Betstats.hello() == :world
  end

  test "gets betstats" do
    assert Betstats.get_betstats() == "Hello, world!"
  end
end
