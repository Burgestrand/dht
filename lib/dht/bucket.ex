defmodule DHT.Bucket do
  @type t :: %DHT.Bucket{range: Range.t(DHT.ID.t, DHT.ID.t), members: []}
  defstruct range: (0..DHT.ID.max), members: []

  @spec cover?(DHT.Bucket.t, DHT.ID.t) :: boolean
  def cover?(%DHT.Bucket{range: range}, id) do
    Enum.member?(range, id)
  end
end
