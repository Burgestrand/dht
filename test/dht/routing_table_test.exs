defmodule DHT.RoutingTableTest do
  use ExUnit.Case, async: true

  test "#cover?" do
    table = %DHT.RoutingTable{}

    assert DHT.RoutingTable.cover?(table, -1) == false
    assert DHT.RoutingTable.cover?(table, 0) == true
    assert DHT.RoutingTable.cover?(table, DHT.ID.max) == true
    assert DHT.RoutingTable.cover?(table, DHT.ID.max + 1) == false
  end
end
