defmodule DHT.RoutingTable do
  @bucket_size 20
  @max_buckets 20

  @type t :: %DHT.RoutingTable{buckets: [DHT.Bucket.t, ...]}
  defstruct buckets: [%DHT.Bucket{}]

  @dec "True if ID is within routing table range."
  @spec cover?(DHT.RoutingTable.t, DHT.ID.t) :: boolean
  def cover?(%DHT.RoutingTable{buckets: buckets}, id) do
    Enum.any?(buckets, &DHT.Bucket.cover?(&1, id))
  end
end
