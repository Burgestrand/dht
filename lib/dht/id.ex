defmodule DHT.ID do
  @length 20

  @type t :: integer

  @doc "Create a new, random ID."
  @spec make :: t
  def make do
    :crypto.rand_bytes(@length) |> :binary.decode_unsigned(:big)
  end

  @doc "Calculate distance between two IDs."
  @spec distance(t, t) :: integer
  def distance(a, b) do
    :erlang.bxor(a, b)
  end

  @doc "Convert ID to a proper human-readable format."
  @spec to_string(t) :: binary
  def to_string(id) do
    id |> Integer.to_string(16) |> String.rjust(@length * 2, ?0)
  end
end
