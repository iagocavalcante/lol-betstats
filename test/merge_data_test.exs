defmodule MergeDataTest do
  use ExUnit.Case, async: true

  test "merge" do
    assert MergeData.merge() == :ok
  end
end
