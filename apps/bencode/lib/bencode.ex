defmodule Bencode do
  alias Bencode.Encoder

  @doc """
  Encode a value to Bencoding.

    iex> Bencode.encode("hello world")
    ["11", ":", "hello world"]
  """
  @spec encode(Encoder.t, Keyword.t) :: iolist
  def encode(value, options \\ []) do
    Encoder.encode(value, options)
  end
end
