defmodule DHT.Bucket do
  @type t :: %DHT.Bucket{range: Range.t(DHT.ID.t, DHT.ID.t), members: Set.t}
  defstruct range: (0..DHT.ID.max), members: HashSet.new

  @doc "True if ID is within bucket range."
  @spec cover?(DHT.Bucket.t, DHT.ID.t) :: boolean
  def cover?(%DHT.Bucket{range: range}, id) do
    Enum.member?(range, id)
  end

  @doc "Number of members in the bucket."
  @spec size(DHT.Bucket.t) :: integer
  def size(%DHT.Bucket{members: members}) do
    Set.size(members)
  end

  @doc "Add a new member to the bucket."
  @spec add(DHT.Bucket.t, DHT.ID.t) :: DHT.Bucket.t
  def add(%DHT.Bucket{members: members} = bucket, id) do
    unless cover?(bucket, id) do
      raise ArgumentError, "#{id} is not within #{inspect bucket.range}"
    end

    %{bucket | members: Set.put(members, id)}
  end
end
