defmodule Bencode do
  alias Bencode.Encoder

  @doc """
  Encode a value to Bencoding.

    iex> Bencode.encode("hello world")
    ["11", ":", "hello world"]
  """
  @spec encode(Encoder.t) :: iolist
  def encode(value) do
    Encoder.encode(value)
  end
end
