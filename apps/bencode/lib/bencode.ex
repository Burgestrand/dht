defmodule Bencode do
  alias Bencode.Encoder

  @doc """
  Encode a value to Bencoding.

    iex> Bencode.encode("hello world")
    {:ok, ["11", ":", "hello world"]}
  """
  @spec encode(Encoder.t, Keyword.t) :: {:ok, iolist}
  def encode(value, options \\ []) do
    iolist = Encoder.encode(value, options)
    {:ok, iolist}
  end
end
