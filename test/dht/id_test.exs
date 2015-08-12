defmodule DHT.IDTest do
  use ExUnit.Case, async: true

  test "#distance is 0 for the same ID" do
    id = DHT.ID.make
    assert DHT.ID.distance(id, id) == 0
  end
end
